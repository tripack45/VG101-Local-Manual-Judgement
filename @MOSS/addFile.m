function addFile(obj,file)
%ADDFILE Summary of this function goes here
%   Detailed explanation goes here
    e = exist(file,'file');
    switch(e)
        case 0
            disp('None Existing File');
            return;
        case 2
            obj.files{end+1}=file;
            disp(['Added File: ',file]);
            return;
        case 7
            disp('Folder specified!');
            return;
    end
end

