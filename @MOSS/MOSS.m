classdef MOSS < handle
    %MOSS Measurement of Software Similarity, Submission Code, Adapted
    %from the PHP Version of the original code 
    %from Philipp Helo Rehs <P.Rehs@gmx.net>
    
    %{
The MIT License (MIT)
Copyright (c) 2014 Philipp Helo Rehs
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the 'Software'), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
/**
 * @author Philipp Helo Rehs <P.Rehs@gmx.net>
 * @version 1.0
 * @moss-version 2.0
 */
%}
    
    properties (Constant = true) 
       allowed_languages = {'c', 'cc', 'java', 'ml', ...
                            'pascal', 'ada', 'lisp', 'scheme', ...
                            'haskell', 'fortran', 'ascii', 'vhdl', ...
                            'perl', 'matlab', 'python', 'mips', ...
                            'prolog', 'spice', 'vb', 'csharp', ...
                            'modula2', 'a8086', 'javascript', 'plsql', ...
                            'verilog'};               
    end
    
    properties 
        options     = struct();
        basefiles   = {};
        files       = {};
        server      = 'moss.stanford.edu';
        port        = 7690;
        userid      = '805216764';
    end
    
    methods (Access = public)
        function obj = MOSS()
            obj.options.m = '10';
            obj.options.d = '0';
            obj.options.n = '250';
            obj.options.x = '0';
            obj.options.c = '';
            obj.options.l = 'c';
        end
    end
    
    methods (Access = public)
        % get a list with all supported languages
        getAllowedLanguages(obj);
        
        % set the language of the source files
        setLanguages(obj,lang);
        
        % Enable Directory-Mode
	    %see -d in MOSS-Documentation
        setDirectoryMode(obj,isEnabled);
        
        %Add a basefile
	    %see -b in MOSS-Documentation
        addBaseFile(obj,file);
        
        %Occurences of a string over the limit will be ignored
        %see -m in MOSS-Documentation
        setIngoreLimit(obj,limit);
        
        % Set the comment for the request
        % @see -s in MOSS-Documentation
        setCommentString(obj,comment);
        
        % Set the number of results
	    % @see -n in MOSS-Documentation
        setResultLimit(obj,limit);
        
        % Enable the Experimental Server
        % @see -x in MOSS-Documentation
        setExperimentalServer(obj,isEnabled);
        
        % Add a file to the request
	    addFile(obj,file);
        
        % Send the request to the server and wait for the response
        read = send(obj);
        
        % Upload a file to the server
        uploadFile(obj,handle, file, id);
    end
end

