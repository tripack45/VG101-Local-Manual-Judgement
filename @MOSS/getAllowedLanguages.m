function [] = getAllowedLanguages(obj)
disp('Supported Languages:');
i=0;
for lang = MOSS.allowedLanguages
    if( mod(i,6)==5); fprintf('\n'); end;
    fprintf('%s, ',lang{1});
    i=i+1;
end
fprintf('\n');
end

