#DEBUG=-DCMAKE_FIND_DEBUG_MODE=ON

APP=test2
APP_NAME=mpsTest2

SIMDIR=/Applications/Xcode.app/Contents/Developer/Applications

DEVICE_NAME=iPad Air 13-inch (M2)
DEVICE_OS=17.5
#DEVICE="platform=iOS Simulator,name=${DEVICE_NAME},OS=${DEVICE_OS}"

DEVICE_ID=C669C32F-55A3-420B-88CB-B025675D1E0D
DEVICE="platform=iOS Simulator,id=${DEVICE_ID}"

CONFIG=Debug

clean:
	rm -rf build sim.log

gen:
	cmake ${DEBUG} \
                -S ./src  -B ./build -GXcode

.PHONY: build
build:
	(cd build; open ${APP}.xcodeproj; )

list-schemes:
	(cd build/${APP}.xcodeproj; xcodebuild -list -workspace project.xcworkspace;)

list-targets:
	(cd build; xcodebuild -list -project ${APP}.xcodeproj;)

list-devices:
	xcrun xctrace list devices

build-sim:
	(cd build/${APP}.xcodeproj; xcodebuild -workspace project.xcworkspace\
             -scheme ${APP_NAME} \
             -destination ${DEVICE} \
             -configuration ${CONFIG} \
        )

sim-list:
	xcrun simctl list

start-sim:
	${SIMDIR}/Simulator.app/Contents/MacOS/Simulator -CurrentDeviceUDID ${DEVICE_ID} >& sim.log &

install-sim:
	xcrun simctl install booted build/${CONFIG}-iphonesimulator/${APP_NAME}.app

# This is extremely verbose
run-sim:
	xcrun simctl spawn booted log stream --level debug --predicate 'subsystem == "com.yrissari.mpsTest2"'

list-appdir:
	xcrun simctl get_app_container booted com.yrissari.mpsTest2 data

screenshot:
	xcrun simctl io booted screenshot --type=png ./sim.png

log:
	tail -F "$(xcrun simctl getenv booted SIMULATOR_LOG_ROOT)/system.log"
