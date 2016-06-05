function returnHW( name )
if(~exist('name','var'))
    disp('Need to provide name');
    return;
end
HWPath = [LMJ.RETURN_DIR, name, '/'];
HWPath = utils.requireFolderOr('Create',HWPath);
for folder = utils.foreach('Folder',LMJ.OUTPUT_DIR)
    folderName = folder.name;
    
    folderPath = [HWPath, folderName];
    folderPath = utils.requireFolderOr('Create', folderPath);
    
    attachmentPath = [folderPath, '/Feedback Attachment(s)/'];
    attachmentPath = utils.requireFolderOr('Create', attachmentPath);
    
    scoreFilePath = [LMJ.OUTPUT_DIR, folderName, '/' , LMJ.SCORE_FILE];
    scoreFile = utils.requireFileOr('Warn',scoreFilePath);
    
    if isempty(scoreFile);
        continue;
    end
    copyfile(scoreFile,[attachmentPath,LMJ.SCORE_FILE]);
end
end

