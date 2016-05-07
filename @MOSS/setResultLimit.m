function setResultLimit(obj,limit)
if ~exist('limit','var') || ~isnumeric(limit)
    disp('Illeagle Input, require an integer input');
    return;
end
limit = fix(limit);
obj.options.n = num2str(limit);
fprintf('Set "-n" option to %d\n',limit);

end

