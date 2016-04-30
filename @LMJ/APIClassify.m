function APIClassify(path,pathout)
    file = dir(path);
    fprintf('Running Classification Process\n');
    fprintf('inputPath=%s\n',path);
    fprintf('outputPath=%s\n',pathout);
    for i = 1 : size(file,1)
        item = file(i);
        if item.isdir
            match = regexpi(item.name,LMJ.FOLDER_TEMPLATE);
            if(~isempty(match))
                disp(['Moving Folder: ', path, item.name]);
                movefile([path, item.name],pathout);
            end
        end
    end
    disp('Done!')
end