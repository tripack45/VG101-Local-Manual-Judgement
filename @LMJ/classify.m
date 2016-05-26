function classify()
%CLASSIFY
path    = utils.requireFolderOr('Create',LMJ.INPUT_DIR);
pathout = utils.requireFolderOr('Create',LMJ.INSPECT_DIR);

fprintf('Running Classification Process\n');
fprintf('inputPath=%s\n',path);
fprintf('outputPath=%s\n',pathout);

for item = utils.foreach('filefolder',path);
    match = regexpi(item.name,LMJ.FOLDER_TEMPLATE);
    if(~isempty(match))
        disp(['Moving Folder: ', path, item.name]);
        movefile([path, item.name],pathout);
    end
end

disp('Done!')
end