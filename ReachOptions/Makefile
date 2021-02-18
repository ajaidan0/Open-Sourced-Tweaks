export GO_EASY_ON_ME = 1

export SYSROOT = $(THEOS)/sdks/iPhoneOS14.0.sdk

export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

SUBPROJECTS += Tweak Preferences

include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"