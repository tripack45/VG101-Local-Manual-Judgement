# VG101 Local Manual Judgement
## Introduction
A local manual judgement system, Intended to speed up judgement by eliminating copying and pasting folders and files, or switching between folders. Now it also comes with tht ability to automatically generating "score files", which contains grading results as well as grading comments. Potentially in the future it will support auto collection of reuslts and generate statistics.

The programme is written in Matlab, not in Python. The reasons are, 1) This programme is first designed for UMJI teaching assistances, initially for VG101. VG100 features 3 languages, Matlab, C/C++. Among them Matlab seems to be the only choice. And using it will not require to configure the python environment. 2) Matlab is easy to write. Vectorized loop eliminates the need to write loops in filtering through directories.

## Features
This sofware is capable of:
* Picking out student homework folders acorrding to a custom rule.
* Automatically collect infomation of the homework just graded.
* Automatically feed the next homework to be graded into custom directory
* **Stateless Design** No need to save/load anything. You can leave and pickup at any time.
* Integreted MOSS code similarity checker. One command to detect almost all plagarism.


## Documentation and Guides:
For people looking for a quick start, see [documents/quickStart](documents/quickStart.md).

For people trying to configure the system for your own purpose, see [documents/configuration](documents/configuration.md).

For people trying to understand its internal behavior, or help develop, see , well not yet written.

## A Word on "Stateless Design".
As the name suggest, the programme is designed to be "Stateless", meaning it does not maintain any internal states. All class methods are static, and all class properties are constants. This results into a couple of things:
* The behavior of the class is completely determined by your state of disk files.
     * If you mess up your state files, You could lose some of your current grading work. But it can most likely be recovered..
     * No need to save or load anything. Grade at anywhere you like, anytime you like. Make use of pieces of time. Stop at anytime you want. 
     * It will NOT be vunlerable to sofware crashing.
* Sadly there currently is no way to change any configuration without opening up the class definition. The useers of the software are assummed at least understand how object oriented programming works. Although it is not that hard to change configuration even if you have zero programming skills. Just follow [documents/configurations](documents/configurations.md).