function params = read_params()
%  READ_PARAMS   Parse parties.inp file into a structure.
%
%  Usage:
%    params = read_params()
%
%  Inputs:
%    n/a
%
%  Outputs:
%    params	- a structure containing fields and values from parties.inp
%
%  David Deepwell, 2019

try
    fileID = fopen('parties.inp');
    tline = fgetl(fileID);
    while ischar(tline)
        if ~isempty(tline) && ~strcmp(tline(1),'[') && ~strcmp(tline(1),'#')
            lin = strtrim(strsplit(tline,'='));
            nam = lin{1};
            val = lin{2};
            % convert scalar string to double
            if is_str_numeric(val)
                val = str2double(val);
            end
            % convert vector string to double
            if strcmp(val(1), '{')
                val = str2num(val(2:end-1));
            end
            params.(nam) = val;
        end
        tline = fgetl(fileID);
    end
    fclose(fileID);
catch
    warning('parties.inp was not found or has a parameter with no value.')
    params = struct();
end
end

function out = is_str_numeric(s)
% boolean output whether string s is numeric
% from http://rosettacode.org/wiki/Determine_if_a_string_is_numeric#MATLAB
    out = ~isempty(parse_float(s));
end

% Returns the float (double) if true, empty array otherwise.
function f = parse_float(s)
    [f_in_cell, pos] = textscan(s, '%f');
    % Make sure there are no trailing chars. textscan(..) is greedy.
    if pos == length(s)
        f = f_in_cell{:};
    else
        f = [];
    end
end
