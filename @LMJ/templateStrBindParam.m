function str = templateStrBindParam(str, param)
if(exist('param','var'))
   for p = utils.foreach('field',param);
       value = param.(p{1});
       if(isnumeric(value))
           value = num2str(value);
       end
       lookUpString = strrep(LMJ.TEMPLATE_VAR,'.*',p);
       str = regexprep(str, lookUpString,value);
   end
end
str = regexprep(str,LMJ.TEMPLATE_VAR,'NULL');
end

