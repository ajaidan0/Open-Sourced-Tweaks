#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSSwitchTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBRespringController.h>
#import <Cephei/HBPreferences.h>
#import <AudioToolbox/AudioServices.h>

@interface MAVAppearanceSettings : HBAppearanceSettings {    
}
@end

@interface MAVRootListController : HBRootListController
@property(nonatomic, retain) UIBarButtonItem *respringApplyButton;
@end

@interface Creds : HBRootListController {
}
@end

@interface SB : HBRootListController {
}
@end

@interface Lockscreen : HBRootListController {
}
@end
@interface Applications : HBRootListController {
}
@end

@interface Reddit : HBRootListController {
}
@end

@interface Haptics : HBRootListController {
}
@end

@interface Reachability : HBRootListController {
}
@end