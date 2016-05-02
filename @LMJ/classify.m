function classify()
%CLASSIFY
   LMJ.checkDirIntegrety();
   
   LMJ.APIClassify(LMJ.INPUT_DIR,LMJ.INSPECT_DIR);
   
end