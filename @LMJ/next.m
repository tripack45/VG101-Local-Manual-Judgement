function next()
   LMJ.checkDirIntegrety();
   
   listInspect = dir(LMJ.INSPECT_DIR);
   listInspect(1:2) = [];
   
   listOriginal = dir(LMJ.ORIGINAL_DIR);
   listOriginal(1:2) = [];
   
   % First deal with working set
   if(~isempty(listOriginal))
       
       assert(length(listOriginal)==1, ...
           ['Error: More than 1 folder in "',LMJ.ORIGINAL_DIR,'"!']);
       
       gradingFolderName=listOriginal.name;
       gradingFolderPath=[LMJ.ORIGINAL_DIR,gradingFolderName];
       
       if(LMJ.ENABLE_STATISTICS)
           scoreFilePath    = [LMJ.WORIKING_DIR,LMJ.SCORE_FILE];
           if(exist(scoreFilePath,'file')==2)
               copyfile(scoreFilePath       ,gradingFolderPath);
               movefile(gradingFolderPath   ,LMJ.OUTPUT_DIR);
               LMJ.emptyWorkingDir();
           else
               disp('Score File Does not exist!');
               disp('Genearate Score File.');
               LMJ.generateScoreFile(struct());
               return;
           end
       else
           movefile(gradingFolderPath,LMJ.OUTPUT_DIR);
           LMJ.emptyWorkingDir();
       end

   else
       disp('Nothing is currently being graded');
   end
   
   
   if(isempty(listInspect))
       disp('No more files for grading');
       if(LMJ.ENABLE_STATISTICS)
            disp('Call LMJ.statistics() for gathering results');
       end
       return;
   else
       gradingFolderName = listInspect(1).name;
       gradingFolderPath = [LMJ.INSPECT_DIR,gradingFolderName];
       disp(['Next Homework: ',gradingFolderPath]);
       movefile(gradingFolderPath,LMJ.ORIGINAL_DIR);
       LMJ.resetWorkingDir();
   end

end

   

