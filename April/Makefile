export ARCHS = arm64 arm64e
export GO_EASY_ON_ME = 1
export SDKVERSION = 13.2
#export SDKVERSION = 13.0

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
