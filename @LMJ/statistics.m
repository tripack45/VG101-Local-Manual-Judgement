function result = statistics()
    LMJ.checkDirIntegrety();
    result = [];
    homeworkList = dir(LMJ.OUTPUT_DIR);
    homeworkList(1:2) = [];
    homeworkList = homeworkList([homeworkList.isdir]);
    if(isempty(homeworkList))
        disp('No reviewed homework!');
        return;
    end
    for homeworkFolder = homeworkList'
        scoreFilePath = [LMJ.OUTPUT_DIR, ...
                    homeworkFolder.name,'/',LMJ.SCORE_FILE];
        paramSet = parseScoreFile(scoreFilePath);
        if isempty(result)
            result = paramSet;
        else
            paramFields = fieldnames(paramSet);
            flag = true;
            for field = paramFields'
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
                fprintf('Unamed section encountered in "%s"', socreFilePath)
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
            paramSet=setfield(paramSet                             ...
                             ,[sectionPrefix,'_',variableMatch.var]...
                             ,variableMatch.value);
            line = fgetl(fid);
            continue;
        end
        line=fgetl(fid);
    end
end

