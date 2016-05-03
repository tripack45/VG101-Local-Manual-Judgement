function APIClassify(path,pathout)

    path    = LMJ.requireFolderOr('Create',path);
    pathout = LMJ.requireFolderOr('Create',pathout);
    
    fprintf('Running Classification Process\n');
    fprintf('inputPath=%s\n',path);
    fprintf('outputPath=%s\n',pathout);
    
    for item = LMJ.foreach('filefolder',path);
        match = regexpi(item.name,LMJ.FOLDER_TEMPLATE);
        if(~isempty(match))
            disp(['Moving Folder: ', path, item.name]);
            movefile([path, item.name],pathout);
        end
    end
    
    disp('Done!')
end