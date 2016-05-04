function list = find(type,path,crit,option)    
    path  = utils.validatePath(path);
    fList = utils.list(type,path,crit);
    if(~exist('option','var'))
        option = '';
    end
    if(strcmpi(option,'NoPath'))
        prefix = '';
    else
        prefix = path;
    end
    for i = 1:length(fList)
        fList(i).name = [prefix,fList(i).name];
        if(fList(i).isdir);
            fList(i).name = [fList(i).name,'/'];
        end
    end
    list = {fList.name}';
end