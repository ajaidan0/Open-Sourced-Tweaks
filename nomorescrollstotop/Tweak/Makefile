ARCHS = arm64 arm64e

TARGET = iphone:clang::13.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = NoMoreScrollstoTop
$(TWEAK_NAME)_FILES = $(TWEAK_NAME).xm
$(TWEAK_NAME)_LIBRARIES = sparkapplist
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "sbreload"
