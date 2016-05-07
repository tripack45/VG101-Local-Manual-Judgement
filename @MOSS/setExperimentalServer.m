function setExperimentalServer(obj,isEnabled)
if ~exist('isEnabled','var') || ~islogical(isEnabled)
    disp('Illeagle Input, require "logical" input type');
    return;
end
if isEnabled
    obj.options.x = '1';
    disp('Enabled Flag "-x"');
else
    obj.options.x = '0';
    disp('Disabled Flag "-x"');
end
end

