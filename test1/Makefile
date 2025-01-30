include make.conf

clean:
	rm -rf build sim.log
	rm -rf ./make.conf src/app.cmake

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
             -configuration ${APP_CONFIG} \
        )

sim-list:
	xcrun simctl list

start-sim: launch-sim

launch-sim:
	${SIMDIR}/Simulator.app/Contents/MacOS/Simulator -CurrentDeviceUDID ${DEVICE_ID} >& sim.log &

install-sim:
	xcrun simctl install booted build/${APP_CONFIG}-iphonesimulator/${APP_NAME}.app

# This is extremely verbose
run-sim:
	xcrun simctl spawn booted log stream --level debug --predicate 'subsystem == "${APP_BUNDLE_NAME}"'

list-appdir:
	xcrun simctl get_app_container booted com.yrissari.${APP_NAME} data

screenshot:
	xcrun simctl io booted screenshot --type=png ./sim.png

log:
	tail -F "$(xcrun simctl getenv booted SIMULATOR_LOG_ROOT)/system.log"
