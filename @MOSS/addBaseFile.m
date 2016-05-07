function addBaseFile(obj,bfile)
%ADDFILE Add a single file or a list of files into the system
if(iscell(bfile))
    for eachFile = bfile'
        path = utils.requireFileOr('Warn',eachFile{1});
        if(~isempty(path))
            obj.bfiles = [obj.bfiles ; eachFile];
        end
    end
else
    path = utils.requireFileOr('Throw',bfile);
    obj.bfiles{end+1} = path;
end
end