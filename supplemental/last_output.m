function num = last_output(var)
% LAST_OUTPUT     Find the last PARTIES output in the working directory
%
%  Usage:
%    num = last_output()
%    num = last_output('Data2d')
%
%  Inputs:
%    - one optional argument. A string of the output file pattern to use
%
%  Outputs:
%    'num' - the number of the last output
%
%  David Deepwell, 2019

    % use the field to find the largest output number
    if exist('var','var')
        files = dir([var,'_*.h5']);
    else
        files = dir('Data_*.h5');
    end
    nfiles = length(files);
    table = struct2dataset(files);

    % find all extensions
    %outputs = zeros(1,nfiles);
    %for ii = 1:nfiles
    %    filename = table{ii,1};
    %    [~, dot_num] = strtok(filename, '.');
    %    ext_num = str2num(dot_num(2:end));
    %    if isempty(ext_num)
    %        outputs(ii) = NaN;
    %    else
    %        outputs(ii) = ext_num;
    %    end
    %end
    %num = max(outputs);
    num = nfiles-1;
end
