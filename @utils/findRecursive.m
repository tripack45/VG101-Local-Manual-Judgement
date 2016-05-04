function list=findRecursive(type,path,crit,option)
    path = utils.validatePath(path);
    if(~exist('option','var'))
        option='';
    end
    list = utils.find(type,path,crit,option);
    folderList = utils.find('folder',path,'.*');
    for i=1:numel(folderList)
        list = [list;utils.findRecursive(type,folderList{i},crit,option)];
    end
end