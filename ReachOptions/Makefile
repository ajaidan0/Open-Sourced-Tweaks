export GO_EASY_ON_ME = 1
export SYSROOT=$(THEOS)/sdks/iPhoneOS14.5.sdk
export ARCHS = arm64 arm64e
export sim

ifeq ($(sim),true)
export SYSROOT=/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator14.5.sdk
export TARGET=simulator:clang::latest
endif

after-package::
	@if [ $(sim) = "true" ]; then\
		sudo rm -rfv /opt/simject/Aeolus.*;\
		sudo cp ./.theos/obj/iphone_simulator/debug/arm64e/Aeolus.dylib /opt/simject;\
		sudo cp ./Tweak/Aeolus.plist /opt/simject;\
		~/simject/bin/resim;\
	fi

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"