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
    try
        rmdir([folder2delete,'/'],'s');
    catch
        disp('========Error============');
        disp('The working dir is not cleared');
        disp('Please manually reset it');
        disp('Delete all things in working dir');
        disp('Then call LMJ.resetWorkingDir()');
        disp('=========================');
    end
end

