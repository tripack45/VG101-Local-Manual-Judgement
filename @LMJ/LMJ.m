classdef LMJ 
    % (L)ocal (M)anual (J)udgement System
    % This class is not meant to be instantialize
    % Basically type next.
    
    
    properties (Constant = true)
       FOLDER_TEMPLATE = '^(\d{10})_(.*)';
       
       TEMPLATE_VAR    = '<#(.*?)#>';
       %The string must only contain one "(.*)" substring       
       
       SCORE_FILE      = 'score.txt';
       SCORE_TEMPLATE  = 'template.txt';
       SCORE_EXPORT_FILE = 'score.xlsx';
       
       SCORE_VAR_TEMPLATE = '^\$(?<var>.+)=(?<value>.*)';
                            % Variable Name must not be empty
                            % Variable Value can be empty
       SCORE_SEC_TEMPLATE = '^\@section=(?<section>.*)$';
       
       WORKING_DIR     = './working/';
       ORIGINAL_DIR    = './original/';
       INSPECT_DIR     = './under_review/';
       INPUT_DIR       = './unclassified/';
       OUTPUT_DIR      = './reviewed/';
       
       ENABLE_STATISTICS = true;
    end
   
    methods (Access = private)
        % This class is designed NOT to be instantiated!
        function obj =  LMJ();end;
    end
    
    methods (Access = public, Static = true)
        classify();
        next();
        statistics();
        checkDirIntegrety();
        resetWorkingDir();
        generateScoreFile(info);
        
    end
    
    
    methods (Access = public, Static =true)
            APIClassify(path,pathout);
            emptyWorkingDir();
    str   = templateStrBindParam(string,param);    
    str   = getGradingFolderName();
    param = parseFolderName(folderName);
            export2xls(statistics,path);
    str   = requireOr(type,action,path);
    list  = foreach(type,object);
    end
    
    methods (Access = private, Static = true)
        function str = requireFileOr(action,path)
            str = LMJ.requireOr('file',action,path);
        end 
        function str = requireFolderOr(action,path)
            switch lower(action)
                case 'create'
                    str = LMJ.requireOr('folder','Warn',path);
                    if isempty(str);mkdir(path);end;
                    str = path;
                otherwise
                    str = LMJ.requireOr('folder',action,path);        
            end
        end
        function str = requireFileFolderOr(action,path)
            str = LMJ.requireOr('filefolder',action,path);
        end
    end
        
end

