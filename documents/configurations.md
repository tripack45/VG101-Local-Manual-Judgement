## Basics
All coniguration are in `Properties (Constants = true)` section inside `@LMJ/LMJ.m`. They are implement as constants inside a class. Changing them basically means change what's right after the `=` operation. Eg. if you are to change `INPUT_DIR` from `./unclassified/` to `./new/`, you need to find
````matlab
Properties (Constants = true)
    ...
    INPUT_DIR       = './unclassified/'; % Line that requires changing
    ...
end
````
And change them into 
````matlab
Properties (Constants = true)
    ...
    INPUT_DIR       = './new/'; % Line that got changed
    ...
end
````
To save your time, you can simply search for the property name. 

The configuration is given in the form 
    PROPERTY_NAME = DEFAULLT_VALUE;