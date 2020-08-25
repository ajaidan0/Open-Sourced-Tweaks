#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <UIKit/UIKit.h>

#import "libcolorpicker.h"

#define CGRectMoveX(x, frame) CGRectMake(x, frame.origin.y, frame.size.width, frame.size.height);

@protocol PreferencesTableCustomView
-(id)initWithSpecifier:(id)arg1;
@end

@interface APRFaceIDTitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView  *bgView;
    UILabel *packageNameLabel;
    UILabel *versionLabel;
}
@end

@interface APREventTitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView  *bgView;
    UILabel *packageNameLabel;
    UILabel *versionLabel;
}
@end

@interface APRWeatherTitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView  *bgView;
    UILabel *packageNameLabel;
    UILabel *versionLabel;
}
@end

@interface APRDateTitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView  *bgView;
    UILabel *packageNameLabel;
    UILabel *versionLabel;
}
@end

@interface APRTimeTitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView  *bgView;
    UILabel *packageNameLabel;
    UILabel *versionLabel;
}
@end

@interface APRTitleCell : PSTableCell <PreferencesTableCustomView> {
    UIView  *bgView;
    UILabel *packageNameLabel;
    UILabel *developerLabel;
    UILabel *versionLabel;
}
-(void)preferencesChanged;
@end