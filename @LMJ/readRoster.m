function roster = readRoster(filename)
delimiter = ',';
startRow = 2;
formatSpec = '%q%q%[^\n\r]';
fileID = fopen(filename,'r','n','UTF-8');
% Skip the BOM (Byte Order Mark).
fseek(fileID, 3, 'bof');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);
fclose(fileID);
gradebook = table(dataArray{1:end-1}, 'VariableNames', {'StudentID','StudentName'});
roster = table2struct(gradebook);
end

