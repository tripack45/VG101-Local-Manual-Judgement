function str=requireOr(type,action,path)
    isExist = 0;
    switch(lower(type))
        case 'folder'
            isExist = (exist(path,'file') == 7);
        case 'file'
            isExist = (exist(path,'file') == 2);
        case 'filefolder'
            isExist = exist(path,'file');
            isExist = (isExist==2 || isExist==7);
        otherwise 
            disp('Illegal call to isExistOr');
            disp('Pause Execution!');
            keyboard;
    end
    if(isExist)
        str = path;
        return;
    else
        switch(lower(action))
            case 'warn'
                fprintf('Warning: "%s"(type:%s) does not exist!\n',path,type); 
            case 'throw'
                throw(MException('Error:Error',...
                    'Error: "%s"(type:%s) does not exist!',path,type));
            case 'ignore'
                %In this case ignores the missing file
            otherwise
                fprintf('Invalid Action. None exist: "%s"(type:%s)\n',path,type);
        end
        str = '';
    end
end
    