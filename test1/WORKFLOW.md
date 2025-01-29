Workflow.
=========

This project uses a Makefile to organize the building
and testing process. 

  * The overall workflow is

```console
$ make clean            # Removes all build artifacts.
$ make gen              # Generates the xcode project.
$ make build-sim        # Builds the app for simulator.
```

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

  * It is also possible to run Xcode on the generated project:

```console
$ make gen
$ make run-xcode
```

  After the xcode gui is running, it is necessary to choose the
  target and device. Then choose Product->Run from the menu.



TO DO:

  Get log output from simulator.


