function extractFiles(fileList)
for file = fileList'
    filePath = file{1};
    unpackFile(filePath);
end

end

function unpackFile(filePath)
    path  = fileparts(filePath);
    path = strrep(path,'/','\');
    path(end + 1) = '\';
    commandTemplate = ['"%s" x "%s" "%s"'];
    command = sprintf(commandTemplate,utils.RAR_EXEC, filePath, [path,'extracted\']);
    fprintf('Executing command: %s\n', command);
    ret = system(command,'-echo');
end

