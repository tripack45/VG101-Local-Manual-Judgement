classdef utils
    %UTILS This is a utility class, designed to be full static.
    %
    
    properties (Constant = true)
        RAR_EXEC = 'C:\Program Files\WinRAR\WinRAR.exe';
    end
    
    methods (Access = private)
        function obj = utils();end;
    end
    
    methods (Access = private, Static = true)
        str = requireOr(type,action,path);
    end
    
    methods (Access = public, Static = true);
        path = validatePath(path);
        list = foreach(type,object);
        list = list(type,path,crit);
        list = findRecursive(type,path,crit,option);
        list = find(type,path,crit,option);
               extractFiles(fileList);
    end
    
    methods (Access = public, Static = true)

        
        
        function str = requireFileOr(action,path)
            str = utils.requireOr('file',action,path);
        end
        
        function str = requireFolderOr(action,path)
            switch lower(action)
                case 'create'
                    str = utils.requireOr('folder','Warn',path);
                    if isempty(str);mkdir(path);end;
                    str = path;
                otherwise
                    str = utils.requireOr('folder',action,path);
            end
        end
        
        function str = requireFileFolderOr(action,path)
            str = utils.requireOr('filefolder',action,path);
        end
    end
    
end

