function writeToGradebookXLS(result)
XLS_PATH = './gradebook.xls'
try
    [~,txt] = xlsread(XLS_PATH);
catch
    disp('Please Force Close Excel');
    return;
end

end

