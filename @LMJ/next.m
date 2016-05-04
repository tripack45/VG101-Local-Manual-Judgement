function next()

   inspectPath = utils.requireFolderOr('Throw',LMJ.INSPECT_DIR);
   listInspect = utils.foreach('folder',inspectPath);
   
   utils.requireFolderOr('Create',LMJ.ORIGINAL_DIR);
   gradingFolderName = LMJ.getGradingFolderName();
   
   % First deal with working set
   if(~isempty(gradingFolderName))
       
       gradingFolderPath=[LMJ.ORIGINAL_DIR,gradingFolderName];
       
       if(LMJ.ENABLE_STATISTICS)
           scoreFilePath = [LMJ.WORKING_DIR,LMJ.SCORE_FILE];
           scoreFilePath = utils.requireFileOr('Ignore',scoreFilePath);
           if(~isempty(scoreFilePath))
               copyfile(scoreFilePath       ,gradingFolderPath);
               movefile(gradingFolderPath   ,LMJ.OUTPUT_DIR);
               LMJ.emptyWorkingDir();
           else
               disp('Score File Does not exist!');
               disp('Genearate Score File.');
               LMJ.generateScoreFile();
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

   

