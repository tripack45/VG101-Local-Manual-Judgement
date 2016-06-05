function export2xls(statistics,path)
%writetable(struct2table(statistics),path);
c = table2cell(struct2table(statistics));
row = size(c, 1);
column = size(c, 2);
header = {};
for i = 1 : column
    header{end+1} = '';
end
header{1,1} = 'Student ID';
header{1,2} = 'Student Name';
c = [header; c];
try
    xlswrite(path,c);
catch
    disp('Error when writing excel file');
    disp('Excel file not writable');
end
end

