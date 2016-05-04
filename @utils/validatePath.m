function path=validatePath(path)
    path = strrep(path,'\','/');
    if(path(end)~='/')
        path(end+1)='/';
    end
end