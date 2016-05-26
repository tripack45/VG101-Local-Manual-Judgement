function param = parseFolderName(folderName)
%PARSEFOLDERNAME Summary of this function goes here
%   Detailed explanation goes here
    param=struct();
    tokens = regexpi(folderName,LMJ.FOLDER_TEMPLATE,'tokens');
    tokens = tokens{1}; % Unpack the first layer
    param.sid = tokens{1};
    if(~isempty(tokens{2}))
        param.title = tokens{2};
    end
    roster = LMJ.readRoster(LMJ.SPREADSHEET_TEMPLATE);
    for item = roster';
        if strcmp(param.sid, item.StudentID)
            param.name = item.StudentName;
            return;
        end
    end
end
