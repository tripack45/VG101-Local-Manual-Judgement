function setLanguage(obj,lang)
    if(~exist('lang','var') || ~ischar(lang))
        disp('Illeagle Input. Require "string" input type.');
        return;
    end
    for tlang = MOSS.allowedLanguages
        tlang = tlang{1};
        if(strcmpi(lang,tlang))
            obj.options.l = tlang;
            fprintf('New language set to: %s\n',tlang);
            return;
        end
    end
    disp('Not an allowed language!');
end

