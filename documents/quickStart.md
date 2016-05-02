## Quick Start Guide:
This point of this part is to let you quickly get started. You can just follow the major bulletins, then go into detail if you met any problem or if you are just curious.

**If you are an teaching assistant for a programming course in UMJI. Thorough read is strongly advied.**

To use the software, please do as follows:

* Start up Matlab, Switch your working directory to the root directory of project.
* Run `LMJ.checkDirIntegrety()` in Matlab command window. 
* Copy the folders you need to judge into `./unclassified/`
* Run `LMJ.classify()` in Matlab command window.
* Run `LMJ.next()` in Matlab command window. And grade what's in `./working/`.
* Keep calling `LMJ.next()` until programme informms your are done.
* Check `./unclassified/` for folders, grade them manually.
* YEAH! Your work is done.


## A detailed version of the quick start guide

* Start up Matlab, Switch your working directory to the root directory of project. 
    * That is where the `template.txt` is
* Run `LMJ.checkDirIntegrety()` in Matlab command window. 
    * You only need to run this once, when you first unpack this software.
    * Running it multiple time will not cause problem
    * Detailed explaination see docmuments/functions
* Copy the folders you need to judge into `./unclassified/`
    * With defualt configuration, this folder should exist
    * If not existed, manually create it
    * Assume that each student has thier homework in an individual folder.
* Run `LMJ.classify()` in Matlab command window.
    * This command will pickout the folders whose name following a predifine pattern.
    * Folders whose name satisfies this will be considered valid, and moved to `./under_review/`
    * For the default setting, this pattern will be "1234567890_homework-name"
    * For people have other need, you need to change it, see documents/configuration/Dir_template
* You now have done the preparation. Now `./working/` will be your working directory. Prepare your judgement toolchain using this path as its working directory.
* Run `LMJ.next()` in Matlab command window.
    * This command copies the next homework that waited to be graded into your working directory.
    * It also clears off the all files from last graded homework.
    * Nothing will be carried on, any change to the homework will discarded!
    * The only exception will be `score.txt` in the working directory. Detailed usage and explaination of the file see documentation/functions/statistics.
* If you have finished grading this homework, run `LMJ.next()` in Matlab command window.
    * Note that the original name of the folder will be shown in command window
    * A faster way to do this will be pressing "Up" key and hit "Enter" in the command window.
* Repeat last step until the programme inform that no more files to be graded.
* Check the folders in `./unclassified/`. These are the folders that are considered "invalid" for naming reasons. Manually grade them. 
* You have finished grading them.