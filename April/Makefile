export ARCHS = arm64 arm64e
export SDKVERSION = 13.5
#export SDKVERSION = 13.0

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
