cmake_minimum_required(VERSION 3.20)

set(HOME $ENV{HOME})

set(PROJECT test2)

project(${PROJECT}
        VERSION "1.0.1"
        LANGUAGES C CXX OBJC OBJCXX)

include ("${CMAKE_CURRENT_SOURCE_DIR}/test2/CMakeLists.txt")
set(PROJECT_SOURCES ${test2_sources})

set(IS_SIMULATOR True)
include (app.cmake)     # define APP_NAME, ...
include (${HOME}/apple/devel.cmake)
include (${HOME}/apple/ios.cmake)

message("App name ${APP_NAME}")
message("Project sources ${PROJECT_SOURCES}")

set(CMAKE_SUPPRESS_REGENERATION true)

set(ICONDIR ${CMAKE_CURRENT_SOURCE_DIR}/icons)

file(GLOB ICON_IMAGES    "${ICONDIR}/*.png" )

add_executable(${APP_NAME} MACOSX_BUNDLE)

set(APP_RESOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/resources)
file(GLOB_RECURSE APP_RESOURCES "${APP_RESOURCE_DIR}/*" )

target_sources(${APP_NAME} PRIVATE
  ${ICON_IMAGES}
  ${PROJECT_SOURCES}
  ${CMAKE_CURRENT_SOURCE_DIR}/LaunchScreen.storyboard
  ${APP_RESOURCES}
)

# Individually set the file's path properties.
foreach (FILE ${APP_RESOURCES})
    # Get the relative path from the data-folder to the particular file.
    file(RELATIVE_PATH NEW_FILE "${APP_RESOURCE_DIR}" ${FILE})

    # Get the relative path to the file.
    get_filename_component(NEW_FILE_PATH ${NEW_FILE} DIRECTORY)

    # Set it's location inside the app package (under Resources).
    set_property(SOURCE ${FILE} PROPERTY MACOSX_PACKAGE_LOCATION "Resources/${NEW_FILE_PATH}")

    # Optional: Add the file to the 'Resources' folder group in Xcode.
    #           This also preserves folder structure.
    source_group("Resources/${NEW_FILE_PATH}" FILES "${FILE}")
endforeach ()

message("App resources ${APP_RESOURCES}")

# Locate system libraries on iOS
find_library(UIKIT UIKit REQUIRED)
find_library(FOUNDATION Foundation)
find_library(MOBILECORESERVICES MobileCoreServices REQUIRED)
find_library(CFNETWORK CFNetwork)
find_library(SYSTEMCONFIGURATION SystemConfiguration)

# link the frameworks located above
target_link_libraries(${APP_NAME} ${UIKIT})
target_link_libraries(${APP_NAME} ${FOUNDATION})
target_link_libraries(${APP_NAME} ${MOBILECORESERVICES})
target_link_libraries(${APP_NAME} ${CFNETWORK})
target_link_libraries(${APP_NAME} ${SYSTEMCONFIGURATION})

target_compile_options(${APP_NAME} PRIVATE "-Wno-deprecated")

#target_sources(${APP_NAME} PRIVATE
#    ${CMAKE_CURRENT_SOURCE_DIR}/resources
#)
#
#set_source_files_properties(${assets_path} PROPERTIES
#    MACOSX_PACKAGE_LOCATION Resources
#)

set_target_properties(${APP_NAME} PROPERTIES
                      MACOSX_BUNDLE YES
                      MACOSX_BUNDLE_INFO_PLIST ${CMAKE_CURRENT_SOURCE_DIR}/plist.in
                      XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_ARC  YES
                      XCODE_ATTRIBUTE_CLANG_ENABLE_OBJC_WEAK YES
                      XCODE_ATTRIBUTE_CLANG_ENABLE_MODULES   YES
                      XCODE_ATTRIBUTE_GCC_PRECOMPILE_PREFIX_HEADER "YES"
#                      XCODE_ATTRIBUTE_GCC_PREFIX_HEADER "${CMAKE_CURRENT_SOURCE_DIR}/${PREFIX_HDR}"

                      XCODE_ATTRIBUTE_IPHONEOS_DEPLOYMENT_TARGET ${APP_DEPLOYMENT_TARGET}

#                      XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "${CODE_SIGN_IDENTITY}"                       # see devel.cmake
#                      XCODE_ATTRIBUTE_DEVELOPMENT_TEAM "${DEVELOPMENT_TEAM_ID}"                        # 
# for manual signing uncomment next line (?)
#                      XCODE_ATTRIBUTE_PROVISIONING_PROFILE_SPECIFIER "${PROVISIONING_PROFILE_NAME}"    #

                      XCODE_ATTRIBUTE_TARGETED_DEVICE_FAMILY ${APP_DEVICE_FAMILY}
                      XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER "${APP_BUNDLE_IDENTIFIER}"
                      XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES NO
#                      XCODE_ATTRIBUTE_INSTALL_PATH "$(LOCAL_APPS_DIR)"

                      XCODE_ATTRIBUTE_ASSETCATALOG_COMPILER_APPICON_NAME "AppIcon"
                      RESOURCE "${ICON_IMAGES}"
)

