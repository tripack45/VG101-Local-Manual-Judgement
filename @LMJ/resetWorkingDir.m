function resetWorkingDir()
LMJ.checkDirIntegrety();
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
        if item.isdir
            copyfile([gradingFolderPath,item.name], ...
                [LMJ.WORKING_DIR,item.name]);
        else
            copyfile([gradingFolderPath,item.name], ...
                LMJ.WORKING_DIR);
        end
    end
else
    disp('You are not grading anything');
    disp('Call "LMJ.next()" to start grading');
end

if(LMJ.ENABLE_STATISTICS)
    LMJ.generateScoreFile();
end
end

