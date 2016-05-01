function addFile(obj,bfile)
%ADDFILE Summary of this function goes here
%   Detailed explanation goes here
    e = exist(bfile,'file');
    switch(e)
        case 0
            disp('None Existing Base File');
            return;
        case 2
            obj.basefiles{end+1}=bfile;
            disp(['Added Base File: ',bfile]);
            return;
        case 7
            disp('Folder specified!');
            return;
    end
end