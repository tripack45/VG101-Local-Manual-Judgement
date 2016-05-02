function checkDirIntegrety()
    checkOrMkdir(LMJ.INPUT_DIR);
    checkOrMkdir(LMJ.WORKING_DIR);
    checkOrMkdir(LMJ.ORIGINAL_DIR);
    checkOrMkdir(LMJ.OUTPUT_DIR);
    checkOrMkdir(LMJ.INSPECT_DIR);
end

function checkOrMkdir(path)
   e = exist(path,'file');
   switch e
       case 0
           disp(['Path "',path,'" does not exist']);
           mkdir(path);
           return;
       case 2
           throw(MException('Error:Error', ...
               ['Path "',path,'" exists as file']));
       case 7
           return;
   end
end