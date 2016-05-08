# Usage

This document covers all the usage aspects. 
The intention of this document is guiding you to try most functionalities. 
This document is **NOT** a technical explaination. For the principles and function explainations, see [document/functions](functions.md).

## Configurations
All coniguration are in `Properties (Constants = true)` section inside `@LMJ/LMJ.m`. They are implement as constants inside a class. Search for their name to quickly locate them. Detailed see [documents/configuration](configurations.md).

The configuration is given in the form `PROPERTY_NAME = DEFAULLT_VALUE; %Type`
    
* Selectiong Input Folder
    *  `INPUT_DIR = './unclassified/'; %String(Directory Path)`
    *  The folder that is supposed to contain all students' homework. The folder must always end with a *backslash("/")*. The system will perform classification in folders within this folder. Moving subfolders that fits certain rule in this folder to another folder. The destination is specified by `INSPECT_DIR`. The rule is specified by `FOLDER_TEMPLATE`.
* Selecting folder to contain classified homework that waiting to be graded
    * `INSPECT_DIR = './under_review/'; %String(Directory Path)`
    * The folder contains all homework that are waiting to be graded. Each subfolder is considered to fit the rule `FOLDER_TEMPLATE` specifies, and is considered to be the homework of one of the students.
* Selecting the rule(pattern/template) of the folder name.
    * `FOLDER_TEMPLATE = '^(\d{10})_(.*)' %String(Regular Expression)`
    * The system will match this regular expression(regexp) against the folders in `INPUT_DIR` and consider those that matches valid homework folders. This expression is a regular expression thus editing it requires some knowlege of regexp. The first group of the regexp will be considered to be Student ID and second part is the name of the homework. These info will be used to fill up template for the score file.
* Selecting your working directory
    * `WORKING_DIR = './working/'; %String(Directory Path)`
    * The folder that you establish your grading enviroment (e.g. IDE project, etc.). The system copies each students work into this folder, empties this folder once you have completeed grading this student's work. 
* Selecting folder to contain graded homework
    * `INSPECT_DIR = './reviewed/'; %String(Directory Path)`
    * The folder contains all homework that are graded.
* Enabling/Diabling Statistics functionality
    * 'ENABLE_STATISTICS = true; %Bool`
    * This switch Enables/Diables the statistics functionality. The statistics functionality enables you to write down your comments and grades of the homework that is being graded. The system will automatically collect the grades and generate an excel file (.xlsx) under the root directory.
    
For other configurable options that we does not mention in here, see [documents/configuration](configurations.md).

## Get to work

### Set up your working environment
It is suggested your set up your environment around/under `WORKING_DIR`. E.g. for a Clion user, a suggested directory setup will be:
```
-- ROOT
    |----- @LMJ
    ...
    |----- grading
             |---- .clion
             |---- working
             ...
```
With his working dir set to be `WORKING_DIR = './grading/working/';`

### Start Grading
After completed above work, call `LMJ.classify()` to classify the folders. You will see the names of the folders being moved and the destination as well. After the process completed, call `LMJ.next()`. This will copy the next homework that you need to grade into your working directory. 

You can now grade this homework.

### Leaving comments and assign grades
You can leave comments and grades for the student in a text file in your working directiory. By default this file is named "score.txt". To change the name of the score file, see [documents/configuration.md](configurations.md). 

The score file is generated according to a template. By default the template is `./template.txt`. To change the location of the file, see [documents/configuration.md](configurations.md). Some the fields in the template will be automatically filled out when the score file is generated. To change this behavior, see [documents/conifiguration.md](configuration.md) and [documents/functions.md](functions.md);

The score file is usually the following structure:
```
@section=general
$sid=1321
$name=john doe
...
Abitratry content
...
@section=ex1
$score=10
...

@section=ex2
$score=20
...

@section=notes
$message=Looks good to me
...

```
All lines in the files, **except** those begins ones start with `@section`/`$`, are ignored. 

The `@section=SECTION_NAME` statement starts a section with name `SECTION_NAME`. After this statement and next `@section` statement(or the end of the file), are considered contents of the section.

In each section, you can define variable-value pair, using statement like `$name=value`. Then you have defined a variable-value pair under the scope of that section. These variables with be collected when you further perform statistics operation. Variables with the same name under different sections will be put in different columns (they will be considered to be different).

For the above scorefile, an entry like following will be generated:

general_sid | general_name | ex1_score | ex2_score | notes_message
------------|--------------|-----------|-----------|-------------
...| | | |
321|john doe| 10 | 20|Looks good to me
...| | | |

Finally, a report can be composed automatically with pandoc for each students using this score file. 

### What now?
Well, you should have completed grading your first homework. Call `LMJ.next()` to start grading another homework. This command will first save the score file (by copying this file to a specified location), then reset your changes on the students homework file(by deleting all files under working directory), move the currently grading folder to "graded folder" (along with its score file), then prepare next homework for you. 

If you have done anything wrong, such as accidentally deleted some file or changed something but you don't remember what have changed. You can reset current folder, by calling `LMJ.resetWorkingDir()`. This well reset all files (including the score file) in the working dir. 

## Garther results.

Call `LMJ.statistics()`. This command will genearte a excel file named `score.xlsx` in the root directory. To change the name or the location of this outputed file, see [documents/configuration.md](configurations.md).

## How do I perform code similarity check.
You need to use the MOSS module. Run the following commands in the command window:

```matlab 
moss = MOSS(); % Instantiate a MOSS system
moss.setDirectoryMode(true); % Enable directory mode
files = utils.findRecuresively('file' ,'./reviewed/' ,'\.*.m'); %find all ".m" files in './reviewed'
moss.addFiles(files); 
moss.send(); %Send the files to the server
```
The first 2 statements prepares the MOSS system. The last 2 statement adds specified files to collection, then send the collection to Stanford MOSS server for detection. The real magic lies in the third staments. The function is in the following form:

    files=utils.findRecursively({'file','folder','filefolder'},PATH_TO_FIND,CRITERIA);
    
The function go through the path you provide recursively, and find files or folders whose name fits the criteria. 
* The first argument specifies the type of object that you are trying to find, possible options are 'file','folder' or 'filefolder'(file or folder).
*  The second argurment provides the path you need to search through.
*  The third argument is a regular expression. Files that match the expression will be put into the result collection.
* There could be a fourth argument, which uses a string to specify certain option. See [documents/functions](functions.md) for details.

Above is basically all the functionalities of the system. To understand the system better, or to help develop, see [documents/functions/md](functions.md) for details. See [documents/configurations](configurations.md) for more detailed configuration. 