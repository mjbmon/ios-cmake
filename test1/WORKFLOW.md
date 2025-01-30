Workflow.
=========

This project uses a [Makefile](Makefile) to organize the building
and testing process. The Makefile is very simple: it is just a place
to hold all of the necessary commands.

  * The overall workflow is

```console
$ make clean            # Removes all build artifacts.
$ make gen              # Generates the xcode project.
$ make build-sim        # Builds the app for simulator.
```

The `gen` target creates a build directory and creates
the xcode project inside of it. The build-sim target
tells xcodebuild to compile the project, creating the
actual app bundle. This takes only a few seconds for
such a small project.

  * To launch the simulator

```console
$ make launch-sim
```

  * After the simulator is running, the app can be installed
onto it:

```console
$ make install-sim      # Install the app onto the simulator.
```

Then the app can be run by clicking on the icon.

  * It is also possible to run the Xcode GUI on the generated project:

```console
$ make gen
$ make run-xcode         # Launch the XCode GUI on the project.
```

  After the xcode gui is running, it is necessary to choose the
  target and device. Then choose Product->Run from the menu.

TO DO:

  Get log output from simulator.


