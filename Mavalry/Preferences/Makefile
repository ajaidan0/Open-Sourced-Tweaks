include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = MavalryPrefs

MavalryPrefs_FILES = MAVRootListController.m MAVAppearanceSettings.m
MavalryPrefs_INSTALL_PATH = /Library/PreferenceBundles
MavalryPrefs_FRAMEWORKS = UIKit
MavalryPrefs_PRIVATE_FRAMEWORKS = Preferences OnBoardingKit
MavalryPrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
MavalryPrefs_CFLAGS = -fobjc-arc


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/mavalryprefs.plist$(ECHO_END)