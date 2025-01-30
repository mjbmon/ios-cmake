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
script. For example:

```
APP=test1
APP_NAME=Test1
APP_COM=com.roachMotel
APP_BUNDLE_NAME=${APP_COM}.${APP_NAME}
...
```

