classdef LMJ 
    % (L)ocal (M)anual (J)udgement System
    % This class is not meant to be instantialize
    % Basically type next.
    
    properties (Constant = true)
       FOLDER_TEMPLATE = '^\d{10}_.*';
       FILE_TEMPLATE   = '';
       README_TEMPLATE = '';
       INSPECT_DIR     = './under_review/';
       INPUT_DIR       = './unclassified/';
       OUTPUT_DIR      = './reviewed/';
    end
    
    methods (Access = private)
        % This 
        function obj =  LMJ()
        end
    end
    
    methods (Static = true)
        classify();
        APIClassify(path,pathout);
    end
        
end

