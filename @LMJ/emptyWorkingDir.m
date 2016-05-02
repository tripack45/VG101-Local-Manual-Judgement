function emptyWorkingDir()
% EMPTYWORKINGDIR 
files = dir(LMJ.WORKING_DIR);
files(1:2) = [];
for item = files'
    file2delete=[LMJ.WORKING_DIR,item];
    disp(['Deleting: ' file2delete]);
    delete(file2delete);
end
end

