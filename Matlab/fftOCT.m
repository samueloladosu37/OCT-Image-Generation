function [B_scan] = fftOCT(B_ready)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[sample_N a_scan_N] = size(B_ready);

temp_fft = zeros(sample_N, a_scan_N);

for i = 1 : a_scan_N
    temp_fft(:, i) = fft(B_ready(:, i));
end

temp_abs_fft = abs(temp_fft);

B_scan = temp_abs_fft(25:sample_N/2, :);
B_scan = 20*log10(B_scan);

end