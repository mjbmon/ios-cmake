# This file assumes that app.cmake has already been
# included so the following cmake variables have been
# set:
#      IS_SIMULATOR
#      APP_NAME
#      APP_BUNDLE_IDENTIFIER
#      APP_ICON_FILE
#      APP_VERSION_STRING
#      APP_COPYRIGHT_STRING
#      APP_DEPLOYMENT_TARGET
#

set (IOS True)
#set(IS_SIMULATOR True)  # now set by CMakeLists.txt

#set(IPHONE_SIM "iPhoneSimulator18.2.sdk")
#set(IPHONE_OS "iPhoneOS18.2.sdk")

# This should point to the latest sdk
set(IPHONE_SIM "iPhoneSimulator.sdk")
set(IPHONE_OS "iPhoneOS.sdk")

message("IS_SIMULATOR ${IS_SIMULATOR}")

enable_language(CXX)
enable_language(OBJC)
enable_language(OBJCXX)

set(CMAKE_XCODE_GENERATE_SCHEME, "TRUE")

set(MACOSX_BUNDLE_EXECUTABLE_NAME ${APP_NAME})
set(MACOSX_BUNDLE_INFO_STRING ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_GUI_IDENTIFIER ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_BUNDLE_NAME ${APP_BUNDLE_IDENTIFIER})
set(MACOSX_BUNDLE_ICON_FILE "")
set(MACOSX_BUNDLE_LONG_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_SHORT_VERSION_STRING "1.0")
set(MACOSX_BUNDLE_BUNDLE_VERSION "1.0")
set(MACOSX_BUNDLE_COPYRIGHT "Copyright YOU")
set(MACOSX_DEPLOYMENT_TARGET ${APP_DEPLOYMENT_TARGET})

set(IOS_PLATFORMS_TOP /Applications/Xcode.app/Contents/Developer/Platforms)
if (${IS_SIMULATOR} )
  set (IOS_PLATFORM_LOCATION "${IOS_PLATFORMS_TOP}/iPhoneSimulator.platform")
  set (IOS_PLATFORM_SDK ${IPHONE_SIM})
else (${IS_SIMULATOR})
  set (IOS_PLATFORM_LOCATION "${IOS_PLATFORMS_TOP}/iPhoneOS.platform")
  set (IOS_PLATFORM_SDK ${IPHONE_OS} ) 
endif()

message("${IOS_PLATFORM_LOCATION}")
set (CMAKE_IOS_DEVELOPER_ROOT "${IOS_PLATFORM_LOCATION}/Developer")
set (CMAKE_IOS_SDK_ROOT       "${IOS_PLATFORM_LOCATION}/Developer/SDKs/${IOS_PLATFORM_SDK}")
set (CMAKE_OSX_SYSROOT ${CMAKE_IOS_SDK_ROOT} )

set (CMAKE_FIND_FRAMEWORK FIRST)

# set up the default search directories for frameworks
set (CMAKE_SYSTEM_FRAMEWORK_PATH
	${CMAKE_IOS_SDK_ROOT}/System/Library/Frameworks
	${CMAKE_IOS_SDK_ROOT}/System/Library/PrivateFrameworks
	${CMAKE_IOS_SDK_ROOT}/Developer/Library/Frameworks
)

# only search the iOS sdks, not the remainder of the host filesystem
set (CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set (CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# How to change this for device?
if (${IS_SIMULATOR} )
  set (IOS_PLATFORM "SIMULATOR64")
  set (IOS_ARCH arm64)
  set (XCODE_IOS_PLATFORM iphonesimulator)
  set (CMAKE_SYSTEM_NAME iOS)
  set (CMAKE_OSX_SYSROOT iphoneos)
  set (CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphonesimulator")
else (${IS_SIMULATOR})
#  set (IOS_PLATFORM "SIMULATOR64")
  set (IOS_ARCH arm64)
  set (XCODE_IOS_PLATFORM iphone)
  set (CMAKE_SYSTEM_NAME iOS)
  set (CMAKE_OSX_SYSROOT iphoneos)
  set (CMAKE_XCODE_EFFECTIVE_PLATFORMS "-iphone")
endif()
