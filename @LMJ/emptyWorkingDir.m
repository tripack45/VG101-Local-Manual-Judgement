function emptyWorkingDir()
% EMPTYWORKINGDIR 
fclose('all');
for item = LMJ.foreach('filefolder',LMJ.WORKING_DIR)
    file2delete=[LMJ.WORKING_DIR,item.name];
    disp(['Deleting: ' file2delete]);
    delete(file2delete);
end
end

