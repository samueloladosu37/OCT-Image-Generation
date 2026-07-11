function make_rotating_gif(filename, nFrames, delayTime, elevation)
%MAKE_ROTATING_GIF Capture a 360-degree rotation of the current 3D plot
%and save it as an animated GIF.
%
%   make_rotating_gif(filename, nFrames, delayTime, elevation)
%
%   filename   : output path, e.g. 'figures/RawBscan_rotation.gif'
%   nFrames    : number of frames in the rotation (default 60)
%   delayTime  : seconds between frames (default 0.05)
%   elevation  : fixed elevation angle in degrees (default 30)

if nargin < 2, nFrames = 60; end
if nargin < 3, delayTime = 0.05; end
if nargin < 4, elevation = 30; end

az = linspace(0, 360, nFrames);

for k = 1:nFrames
    view(az(k), elevation);
    drawnow;
    frame = getframe(gcf);
    im = frame2im(frame);
    [imind, cm] = rgb2ind(im, 256);
    if k == 1
        imwrite(imind, cm, filename, 'gif', 'LoopCount', inf, 'DelayTime', delayTime);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end
end

end
