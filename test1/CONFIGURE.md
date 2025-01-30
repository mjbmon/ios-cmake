Configuring the project
=======================

The configure script generates the Makefile that
is used to build the project, see [Workflow](WORKFLOW.md).

To configure the project:

```console
$ ./configure
```

The configure script contains a number of variable
settings for the Makefile and for the src/CMakeFiles.txt
script:

```
APP=test1
APP_NAME=Test1
APP_COM=com.roachMotel
APP_BUNDLE_NAME=${APP_COM}.${APP_NAME}
SIMDIR=/Applications/Xcode.app/Contents/Developer/Applications
DEVICE_NAME="iPad Air 13-inch (M2)"
DEVICE_OS=17.5
#DEVICE="platform=iOS Simulator,name=${DEVICE_NAME},OS=${DEVICE_OS}"
DEVICE_ID=C669C32F-55A3-420B-88CB-B025675D1E0D
DEVICE="platform=iOS Simulator,id=${DEVICE_ID}"
CONFIG=Debug
```

