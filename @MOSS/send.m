function read = send(obj)
socket = tcpip(obj.server, obj.port, 'NetworkRole', 'client');
socket.Timeout = 60.0;
socket.OutputBufferSize = 20*1024^2;
fopen(socket);
if(~strcmp(socket.status,'open'))
    disp('Error, Cannot Connect to server');
    return;
else
    disp('Successfully Connected to Server');
    endl = sprintf('\n');
    fwrite(socket, ['moss '         ,obj.userid     ,endl]);
    fwrite(socket, ['directory '    ,obj.options.d  ,endl]);
    fwrite(socket, ['X '            ,obj.options.x  ,endl]);
    fwrite(socket, ['maxmatches '   ,obj.options.m  ,endl]);
    fwrite(socket, ['show '         ,obj.options.n  ,endl]);
    %Language Check
    fwrite(socket, ['language '     ,obj.options.l  ,endl]);
    disp('Waiting For responses');
    read = strtrim(fgets(socket));
    disp(['Response: ',read]);
    if(strcmp(read,'no'))
        fwrite(socket, 'end\n');
        fclose(socket);
        disp('Server returned no. Unsupported language');
    end
    disp('Sending Base Files');
    for ibFile = 1:length(obj.basefiles)
        obj.uploadFile(socket, obj.basefiles{ibFile}, 0);
    end
    disp('Sending Files');
    for iFile = 1:length(obj.files)
        disp(['Uploading: ',obj.files{iFile}]);
        obj.uploadFile(socket, obj.files{iFile}, iFile);
    end
    fwrite(socket, ['query 0 ', obj.options.c,endl]);
    disp('Reading Responses');
    read = fgets(socket);
    fwrite(socket, 'end\n');
    fclose(socket);
    disp('End of execution, the response URL:');
    disp(read);
end
end

