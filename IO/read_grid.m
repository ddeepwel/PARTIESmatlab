function gd = read_grid(varargin)
%  READ_GRID  load the grid from PARTIES.
%
%  Usage:
%    gd = read_grid() gives the vector grid in a structure
%
%  Inputs:
%    Optional arguments:
%	'Vector'    - (default) gives vector grid in output structure
%	'Full'      - gives the entire grid in output structure
%	'FastFull'  - gives the entire grid, as calculated from parameters in parties.inp
%
%  Outputs:
%    gd		- structure containing the grid
%
%  David Deepwell, 2019

% select input file
if nargin == 1
    filename = varargin{1};
else
    filename = 'Data_0.h5';
end

% place into output structure
if contains(filename, '2d')
    gd.x = h5read(filename, '/grid/x');
    gd.y = h5read(filename, '/grid/y');
    gd.z = h5read(filename, '/grid/z');
else
    gd.xc = h5read(filename, '/grid/xc');
    gd.yc = h5read(filename, '/grid/yc');
    gd.zc = h5read(filename, '/grid/zc');
    gd.xu = h5read(filename, '/grid/xu');
    gd.yv = h5read(filename, '/grid/yv');
    gd.zw = h5read(filename, '/grid/zw');
end


