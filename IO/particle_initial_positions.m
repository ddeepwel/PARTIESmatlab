function [part, Np] = particle_initial_positions()
%  PARTICLE_INITIAL_POSITIONS   Parse p_mobile.inp file into a vector.
%
%  Usage:
%   [part, Np] = particle_initial_positions()
%
%  Inputs:
%    n/a
%
%  Outputs:
%    part	- a vector containing the initial x,y,z positions and radius of the particles
%    Np     - the number of particles
%
%  David Deepwell, 2020

try
    fileID = fopen('p_mobile.inp');
    tline = fgetl(fileID);
    Np = str2num(tline);
    tline = fgetl(fileID);
    ii = 1;
    while ischar(tline)
        part(ii,:) = str2num(tline);
        tline = fgetl(fileID);
        ii = ii+1;
    end
    fclose(fileID);
catch
    warning('p_mobile.inp was not found or has a parameter with no value.')
end
