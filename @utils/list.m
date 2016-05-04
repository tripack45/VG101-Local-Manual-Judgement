function list = list(type, path, crit)
%LISTALL suppose to be an expansion to dir
    mask = [];
    fList = utils.foreach(type,path);
    for item = fList  % for each file in fList
        match = regexpi(item.name,crit,'match');
        if(~isempty(match))
            mask(end+1) = true;
        else 
            mask(end+1) = false;
        end
    end
    fList = fList(logical(mask));
    list = fList;
end
