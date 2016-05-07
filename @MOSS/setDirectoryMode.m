function setDirectoryMode(obj,isEnabled)
if ~exist('isEnabled','var') || ~islogical(isEnabled)
    disp('Illeagle Input, require "logical" input type');
    return;
end
if isEnabled
    obj.options.d = '1';
    disp('Enabled Flag "-d"');
else
    obj.options.d = '0';
    disp('Disabled Flag "-d"');
end
end

