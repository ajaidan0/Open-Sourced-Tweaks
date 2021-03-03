export SYSROOT=$(THEOS)/sdks/iPhoneOS14.5.sdk
export ARCHS = arm64 arm64e
export sim

ifeq ($(sim),true)
export SYSROOT=/Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator14.5.sdk
export TARGET=simulator:clang::latest
endif

after-package::
	@if [ $(sim) = "true" ]; then\
		rm -rfvv /opt/simject/Aeolus.*;\
		cp ./.theos/obj/iphone_simulator/debug/arm64e/Aeolus.dylib /opt/simject;\
		cp ./Tweak/Aeolus.plist /opt/simject;\
		~/simject/bin/resim;\
	fi

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard" 