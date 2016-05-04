function addFile(obj,file)
%ADDFILE Add a single file or a list of files into the system
if(iscell(file))
    for eachFile = file'
        path = utils.requireFileOr('Warn',eachFile{1});
        if(~isempty(path))
            obj.files = [obj.files ; eachFile];
        end
    end
else
    path = utils.requireFileOr('Warn',file);
    obj.files{end+1} = path;
end
end

