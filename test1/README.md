A Very Simple IOS App.
======================

This project builds an IOS app that has a button and a label. The button
action hides/shows the label. The project is intended as a possible
starting template for ObjectiveC/C++ and C++ apps on IOS. The project
only uses a storyboard for the app launch screen (which should only
display for a very brief time anyway). 

The main approach for this project is to strictly use the command-line
to configure, build, and install the app.

The project uses a standard configure/Make process to manage all
of the steps. The configure and Makefile scripts are extremely
straightforward. The Makefile is responsible for actually running
CMake. CMake in turn knows how to build an XCode project 

For more details on building, etc. see

[Configure](CONFIGURE.md)

[Workflow](WORKFLOW.md)

Currently this app is limited to running on the simulator. Installing on
an actual IOS device requires an Apple developer account etc.

##Prerequisites:

  * Familiarity with shell scripting.
  * Limited familiarity with Make scripts.
  * A text editor.
  * XCode and XCode command-line utilities.
  * CMake
  * Git
  * (recommended) Python

##TO DO:

  * Document the configure process in more detail.

  * Document the app code

    * main, AppDelegate, ViewController
    * cns.h, cns.cc
    * ctest.h ctest.cc

  * Document the CMake scripts.

  * Sometimes the simulator launches but nothing shows
    up on the screen. Clicking on the icon in the taskbar
    may launch it. 

  * Add a screenshot.

  * Work on configuring/building/installing app to real devices.

  * Packaging for app store.

