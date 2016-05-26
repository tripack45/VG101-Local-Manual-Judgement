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
       
       SPREADSHEET_TEMPLATE='gradebook.csv';
       
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
        importClassify(template);
        classify();
        next();
        result = statistics();
        checkDirIntegrety();
        resetWorkingDir();
        generateScoreFile(info);
        
    end
    
    
    methods (Access = public, Static =true)
            emptyWorkingDir();
    str   = templateStrBindParam(string,param);    
    str   = getGradingFolderName();
    param = parseFolderName(folderName);
            export2xls(statistics,path);
    roster= readRoster(filename);
    end
    
    methods (Access = private, Static = true)

    end
        
end

