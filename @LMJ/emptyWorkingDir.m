function emptyWorkingDir()
% EMPTYWORKINGDIR 
fclose('all');
for item = utils.foreach('file',LMJ.WORKING_DIR)
    file2delete=[LMJ.WORKING_DIR,item.name];
    disp(['Deleting: ' file2delete]);
    delete(file2delete);
end
for item = utils.foreach('folder',LMJ.WORKING_DIR)
    folder2delete=[LMJ.WORKING_DIR,item.name];
    disp(['Deleting: ' folder2delete]);
    rmdir(folder2delete,'s');
end
end

