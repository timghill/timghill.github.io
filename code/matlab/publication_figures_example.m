% Example of making high quality mixed vector/raster figures in Matlab
% using the vecrast package.
%
% Axes labels, ticks, and borders are saved as vector objects (meaning they
% are infinitely zoomable and will maintain sharp borders) while the plot
% content is saved as a raster image. This is useful when you are plotting
% a high resolution 2D field where saving the entire figure as a vector PDF
% would make the figure file massive.
%
% This example uses satellite-derived surface albedo for Kaskawulsh Glacier

%% Set up the figure
% Need to set the figure size in points, but journals usually specify the
% size they want in cm. So, convert the desired width into points
cm_to_pt = 28.3465;

width_cm = 15;
width_pt = round(cm_to_pt * width_cm);

height_cm = 10;
height_pt = round(cm_to_pt * height_cm);

dpi = 600;
figname = 'fig';

% Make sure you specify the units before the values here!
fig1 = figure('Units', 'points', 'Position', [200, 200, width_pt, height_pt]);

%% Plot some data
% Load some sample data (Kaskawulsh satellite-derived albedo)
data = load('sample_data.mat');

% You can tune the values [x0, y0, width, height] in this call to fit the
% axes and labels on the figure
ax = axes('Position', [0.125, 0.1, 0.85, 0.85]);

pcolor(data.xx, data.yy, data.albedo)
shading flat
colormap('bone')
% colormap(palettes('blue-1'))      % For a better colormap!
caxis([0, 1])
colorbar
xlabel('Easting (m)')
ylabel('Northing (m)')
axis image

% You will need to tune these (x, y) values to place the text were you want
% it
text(1, 1.05, 'Albedo (-)', 'Units', 'normalized')

vecrast(fig1, figname, dpi, 'top', 'pdf')
