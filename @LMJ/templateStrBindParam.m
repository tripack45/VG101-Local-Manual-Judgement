function str = templateStrBindParam(str, param)
if(exist('param','var'))
   paramList = fieldnames(param);
   paramList = paramList';
   for p = paramList % for each param in paramList;
       p = p{1};
       value = getfield(param,p);
       if(isnumeric(value))
           value = num2str(value);
       end
       lookUpString = strrep(LMJ.TEMPLATE_VAR,'.*',p);
       str = regexprep(str, lookUpString,value);
   end
end
str = regexprep(str,LMJ.TEMPLATE_VAR,'NULL');
end

