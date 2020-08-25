/*
 * April : APRRootListController.h
 * 
 * Authored by ConstanzeDev and LacertosusDeus (c) 2020 
 * Maintained by ajaidan0 (c) 2020
*/

#import "NSTask.h"
#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSSwitchTableCell.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <spawn.h>

#import "libcolorpicker.h"
#import "Common.h"

@interface APRRootListController : HBRootListController
@end

@interface APRTimeListController : HBRootListController
@end

@interface APRDateListController : HBRootListController
@end

@interface APRWeatherListController : HBRootListController
@end

@interface APREventListController : HBRootListController
@end

@interface APRFaceIDListController : HBRootListController
@end

@interface UIImage (Private)
+ (id)_applicationIconImageForBundleIdentifier:(id)arg1 format:(int)arg2 scale:(double)arg3;
@end