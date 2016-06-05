function result = statistics()

if(~LMJ.ENABLE_STATISTICS)
    disp('Error: Statistic function not enabled!');
    return;
end

outputPath = utils.requireFolderOr('Create',LMJ.OUTPUT_DIR);

result = [];

homeworkList = utils.foreach('folder',outputPath);
if(isempty(homeworkList))
    disp('No reviewed homework!');
    return;
end

for homeworkFolder = utils.foreach('folder',LMJ.OUTPUT_DIR)
    
    scoreFilePath = [LMJ.OUTPUT_DIR, ...
        homeworkFolder.name,'/',LMJ.SCORE_FILE];
    
    scoreFilePath = utils.requireFileOr('Warn',scoreFilePath);
    if isempty(scoreFilePath)
        continue;
    end
    
    paramSet = parseScoreFile(scoreFilePath);
    if isempty(result)
        result = paramSet;
    else
        flag = true;
        for field = utils.foreach('field',paramSet);
            field = field{1};
            if(flag)
                flag = false;
                result(end+1).(field) = paramSet.(field);
            else
                result(end).(field) = paramSet.(field);
            end
        end
    end
end

LMJ.export2xls(result,LMJ.SCORE_EXPORT_FILE);

displayStatistics(result);
end

function paramSet = parseScoreFile(scoreFilePath)
fid = fopen(scoreFilePath,'r');
line = fgetl(fid);
paramSet = struct();
sectionPrefix = 'NULL';
while ischar(line)
    %check for section
    sectionMatch = regexpi(line,LMJ.SCORE_SEC_TEMPLATE,'names');
    if length(sectionMatch)==1
        if isempty(sectionMatch.section)
            fprintf('Unamed section encountered in "%s"',...
                socreFilePath)
            sectionMatch.section='NULL';
        end
        sectionPrefix = sectionMatch.section;
        line = fgetl(fid);
        continue;
    end
    variableMatch = regexpi(line,LMJ.SCORE_VAR_TEMPLATE,'names');
    if length(variableMatch)==1
        if isempty(variableMatch.value)
            variableMatch.value = '0';
        end
        paramSet.([sectionPrefix,'_',variableMatch.var]) ...
            = variableMatch.value;
        line = fgetl(fid);
        continue;
    end
    line=fgetl(fid);
end
fclose(fid);
end

function displayStatistics(result)
    table = struct2table(result);
    header = table.Properties.VariableNames; 
    data = table2cell(table);
    table=uitable('Data',data,'ColumnName',header);
    t = gcf;
    t.Position(3) = t.Position(3)*1.5;
    t.Position(1) = t.Position(1)*0.7;
    npos = [[0,0],t.Position(3:4)];
    table.Position=npos;
end
