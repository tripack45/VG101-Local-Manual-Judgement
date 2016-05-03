function str = getGradingFolderName()
listOriginal = dir(LMJ.ORIGINAL_DIR);
listOriginal(1:2) = [];
if(~isempty(listOriginal))
    assert(length(listOriginal)==1, ...
        ['Error: More than 1 folder in "',LMJ.ORIGINAL_DIR,'"!']);
    gradingFolderName=listOriginal.name;
else
    gradingFolderName='';
end
str = gradingFolderName;
end

