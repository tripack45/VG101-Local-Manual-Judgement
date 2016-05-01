function uploadFile(obj,handle, file, id)
%   UPLOADFILE Function used to upload file
endl=sprintf('\n');
content = fileread(file);
size    = length(content);
file_name_fixed = strrep(' ', '_', file);
fwrite(handle, ['file ',num2str(id),' ' ...
    ,obj.options.l,' ', num2str(size),' ',file_name_fixed,endl]);
fwrite(handle, content );
end

