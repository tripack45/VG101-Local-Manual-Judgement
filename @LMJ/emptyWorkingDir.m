function emptyWorkingDir()
% EMPTYWORKINGDIR 
fclose('all');
files = dir(LMJ.WORKING_DIR);
files(1:2) = [];
for item = files'
    file2delete=[LMJ.WORKING_DIR,item.name];
    disp(['Deleting: ' file2delete]);
    delete(file2delete);
end
end

