function resetWorkingDir()
LMJ.checkDirIntegrety();
if(LMJ.ENABLE_STATISTICS)
    disp('NOT YET IMPLEMENTED');
else
    LMJ.emptyWorkingDir();
    listOriginal = dir(LMJ.ORIGINAL_DIR);
    listOriginal(1:2) = [];
    
    % First deal with working set
    if(~isempty(listOriginal))
        
        assert(length(listOriginal)==1, ...
            ['Error: More than 1 folder in "',LMJ.ORIGINAL_DIR,'"!']);
        
        disp(['Setting up working dir for: ',listOriginal.name]);
        gradingFolderName=[listOriginal.name,'/'];
        gradingFolderPath=[LMJ.ORIGINAL_DIR,gradingFolderName];
        
        listGradingFiles = dir(gradingFolderPath);
        listGradingFiles(1:2) = [];
        for item = listGradingFiles'
            copyfile([gradingFolderPath,item.name],LMJ.WORKING_DIR);
        end
    else
        disp('You are not grading anything');
        disp('Call "LMJ.next()" to start grading');
    end
end
end

