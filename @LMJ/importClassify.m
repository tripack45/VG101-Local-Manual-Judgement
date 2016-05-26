function importClassify(fileNameTemplate)
%IMPORTCLASSIFTY 
path    = utils.requireFolderOr('Create',LMJ.INPUT_DIR);
pathout = utils.requireFolderOr('Create',LMJ.INSPECT_DIR);

fprintf('Importing Folders\n');
fprintf('inputPath=%s\n',path);
fprintf('outputPath=%s\n',pathout);

for item = utils.foreach('filefolder',path)
    match = regexpi(item.name,LMJ.FOLDER_TEMPLATE);
    if(~isempty(match))
        files = utils.findRecursive('file',[path,item.name],fileNameTemplate);
        if(isempty(files))
           continue;
        end
        source = fileparts(files{1});
        fprintf('Identified directory: %s\n',[path,item.name]);
        fprintf('Identified valid dir: %s\n',source);
        disp(['Copying Folder: ', source]);
        copyfile(source,[pathout,item.name]);
    end
end

disp('Done!')
end

