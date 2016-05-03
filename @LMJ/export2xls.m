function export2xls(statistics,path)
    writetable(struct2table(statistics),path);
end

