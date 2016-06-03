function list = foreach(type,object)
    type = lower(type);
    switch type
        case 'file'
            list = dir(object);
            list(1:2) = [];
            list = list(~[list.isdir]);
            list = list';
            return;
        case 'folder'
            list = dir(object);
            list(1:2) = [];
            list = list([list.isdir]);
            list = list';
            return;
        case 'filefolder'
            list = dir(object);
            list(1:2) = [];
            list = list';
            return;
        case 'field'
            list = fieldnames(object);
            list = list';
            return;
        otherwise
            throw(MException('Error:Error',...
                'Illeagle call to foreach: %s',type));
            return;
    end     
end