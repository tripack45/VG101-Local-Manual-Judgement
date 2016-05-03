function generateScoreFile(forceWrite)
%GENERATESCOREFILE 
scoreFilePath=[LMJ.WORKING_DIR,LMJ.SCORE_FILE];
if(exist(scoreFilePath,'file'))
    if(~exist('forceWrite','var')||~forceWrite)
        disp(['Score File "',scoreFilePath,'" already exist.'])
        disp('Call generateScoreFile(true) to override.');
        return;
    else
        disp('Score file already exist, overwriting');
    end
end
gradingFolderName = LMJ.getGradingFolderName();
if(isempty(gradingFolderName))
    disp('You are not grading anything');
    return;
end
param = LMJ.parseFolderName(gradingFolderName);
fid = fopen(scoreFilePath,'w+'); %clear old content and create file;
content = fileread(LMJ.SCORE_TEMPLATE);
content = LMJ.templateStrBindParam(content,param);
fprintf(fid,'%s',content);
fclose(fid);
end

