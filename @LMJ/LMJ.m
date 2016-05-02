classdef LMJ 
    % (L)ocal (M)anual (J)udgement System
    % This class is not meant to be instantialize
    % Basically type next.
    
    
    properties (Constant = true)
       FOLDER_TEMPLATE = '^\d{10}_.*';
       FILE_TEMPLATE   = '';
       README_TEMPLATE = '';
       SCORE_FILE      = 'score.txt';
       SCORE_TEMPLATE  = 'template.txt';
       WORKING_DIR     = './working/';
       ORIGINAL_DIR    = './original/';
       INSPECT_DIR     = './under_review/';
       INPUT_DIR       = './unclassified/';
       OUTPUT_DIR      = './reviewed/';
       
       ENABLE_STATISTICS = false;
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
    
    
    methods (Access = private, Static =true)
        APIClassify(path,pathout);
        emptyWorkingDir();
    end
        
end

