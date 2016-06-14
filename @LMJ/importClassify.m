function importClassify(fileNameTemplate, ignoreHiddenFiles)
%IMPORTCLASSIFTY 
path    = utils.requireFolderOr('Create',LMJ.INPUT_DIR);
pathout = utils.requireFolderOr('Create',LMJ.INSPECT_DIR);

fprintf('Importing Folders\n');
fprintf('inputPath=%s\n',path);
fprintf('outputPath=%s\n',pathout);

for item = utils.foreach('folder',path)
    files = utils.findRecursive('file',[path,item.name],fileNameTemplate);
    if(isempty(files))
        continue;
    end
    if (~exist('ignoreHiddenFiles','var') ...
            || ignoreHiddenFiles == false)
        filterHiddenFiles = {};
        for i = 1 : numel(files)
            [~, name, ~] = fileparts(files{i});
            if (name(1) == '.')
                continue;
            end
            filterHiddenFiles{end + 1} = files{i};
        end
        files = filterHiddenFiles;
    end
    if(isempty(files))
        disp('Subfolder contain hidden files only:');
        disp(path);
        continue;
    end
    source = fileparts(files{1});
    fprintf('Identified directory: %s\n',[path,item.name]);
    fprintf('Identified valid dir: %s\n',source);
    disp(['Copying Folder: ', source]);
    copyfile(source,[pathout,item.name]);
end

disp('Done!')
end

