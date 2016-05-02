function generateScoreFile(forceWrite)
%GENERATESCOREFILE 
scoreFilePath=[MLJ.WORKING_DIR,LMJ.SCORE_FILE];
if(exist(scoreFilePath,'file'))
    if(~exist('forceWrite','var')||~forceWrite)
        throw(MException('Error:Error',...
            ['Score File "',scoreFilePath,'" already exist.', ...
            'Call generateScoreFile(true) to override.']));
    else
        disp('Score file already exist, overwriting');
    end
end
gradingFolderName = MLJ.getGradingFolderName();
if(isempty(gradingFolderName))
    disp('You are not grading anything');
    return;
end
param = MLJ.parseFolderName(gradingFolderName);
fid = fopen(scoreFilePath,'w+'); %clear old content and create file;
content = fileread(MLJ.SCORE_TEMPLATE);
content = MLJ.templateStrBindParam(content,param);
fprints(fid,'%s',content);
fclose(fid);
end

