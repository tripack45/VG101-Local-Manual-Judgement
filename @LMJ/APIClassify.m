function APIClassify(path,pathout)
    file = dir(path);
    fprintf('Running Classification Process\n');
    fprintf('inputPath=%s\n',path);
    fprintf('outputPath=%s\n',pathout);
    folderList = file([file.isdir])';
    for item = folderList; %for each item in folderList
        match = regexpi(item.name,LMJ.FOLDER_TEMPLATE);
        if(~isempty(match))
            disp(['Moving Folder: ', path, item.name]);
            movefile([path, item.name],pathout);
        end
    end
    disp('Done!')
end