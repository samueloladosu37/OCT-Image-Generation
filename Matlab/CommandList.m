%% OCT B-scan Processing Pipeline
% Uses raw H/V interferogram data already imported into the workspace
% as tables, builds a raw B-scan from the V channel, applies k-space
% rescaling (sc_process), then reconstructs the OCT B-scan via FFT
% (fftOCT). Exports all figures to /figures for use in the GitHub README.
%
% Requires sc_process.m, fftOCT.m, and make_rotating_gif.m to be on the
% MATLAB path, and RawDATAH, RawDATAV, and rescalingtable1sample to
% already be loaded in the workspace (e.g. via Import Data).

if ~exist('figures', 'dir')
    mkdir('figures');
end

% Suppress the floating axes toolbar in every figure created below, so
% exported PNGs/GIFs come out clean without the toolbar icon baked in.
set(groot, 'defaultAxesToolbarVisible', 'off');

%% Convert imported tables to numeric arrays
Data_H = table2array(RawDATAH);
Data_V = table2array(RawDATAV);

%% Figure 1: Raw A-line signals (2D — static PNG only)
figure;
plot(Data_H(1:3800));
hold on;
plot(Data_V(1:3800));
hold off;
legend('Data_H', 'Data_V');
title('Raw A-line (first 3800 samples)');
exportgraphics(gcf, 'figures/RawAline.png', 'Resolution', 300);

%% Reshape Data_V into a B-scan: 3800 samples x 500 A-lines
numSamples = 3800;
numLines   = 500;

assert(numel(Data_V) >= numSamples * numLines, ...
    'Data_V has fewer samples than expected (%d x %d).', numSamples, numLines);

B_sc_data = reshape(Data_V(1:numSamples*numLines), numSamples, numLines);

%% Figure 2: Raw B-scan (3D — rotating GIF)
figure;
mesh(B_sc_data);
title('Raw B-scan (unscaled)');
view(3);
exportgraphics(gcf, 'figures/RawBscan.png', 'Resolution', 300);   % static fallback
make_rotating_gif('figures/RawBscan_rotation.gif');

%% Use the rescaling table already in workspace
scaling = rescalingtable1sample{:,1};

%% Step 1: apply rescaling (linear-in-k resampling)
B_sc_ready = sc_process(B_sc_data, scaling);

%% Figure 3: Rescaled B-scan (3D — rotating GIF)
figure;
mesh(B_sc_ready);
title('Rescaled B-scan');
view(3);
exportgraphics(gcf, 'figures/RescaledBscan.png', 'Resolution', 300);   % static fallback
make_rotating_gif('figures/RescaledBscan_rotation.gif');

%% Step 2: FFT to reconstruct the OCT B-scan
B_scan = fftOCT(B_sc_ready);

%% Figure 4: Final OCT B-scan (top-down view — static PNG)
figure;
mesh(B_scan);
view(2);
title('OCT B-scan');
exportgraphics(gcf, 'figures/OCT_Bscan.png', 'Resolution', 300);