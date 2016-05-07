function setIgoreLimit(obj,limit)
if ~exist('limit','var') || ~isnumeric(limit)
    disp('Illeagle Input, require an integer input');
    return;
end
limit = fix(limit);
obj.options.m = num2str(limit);
fprintf('Set "-m" option to %d\n',limit);

end

