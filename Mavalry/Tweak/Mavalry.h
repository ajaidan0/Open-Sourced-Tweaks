/*
 * Mavalry : Mavalry.h
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import <UIKit/UIControl.h>
#import <Cephei/HBPreferences.h>
#import <sys/utsname.h>
#import <AudioToolbox/AudioServices.h>
#import <spawn.h>

extern NSString *const kCAFilterDestOut;

@interface SBRootFolderView : UIView
- (UIViewController *)todayViewController;
@end

@interface NCNotificationListSectionRevealHintView : UIView
@property(nonatomic, assign, readwrite, getter=isHidden) BOOL hidden;
@end

BOOL isEnabled;

// Booleans
BOOL wantsHomeBar, wantsOlderNotifs, wantsTransparentDock, wantsHiddenPageDots, wantsHiddenLabels, hideFolderBackground, moonGone, noTodayLS, noTodayHS, noSpotlight, wantsHapticVol, wantsHapticScreenshot, reachChevron, reachTimer, wantsBatteryPercentage;

// Floats
CGFloat hapticPref, volumePref, screenshotPref;

static void prefs() 
{
    HBPreferences *preferences = [[HBPreferences alloc] initWithIdentifier:@"com.ajaidan.mavalryprefs"];
	[preferences registerBool:&isEnabled default:NO forKey:@"isEnabled"];
	[preferences registerBool:&moonGone default:NO forKey:@"moonGone"];
	[preferences registerBool:&wantsBatteryPercentage default:NO forKey:@"wantsBatteryPercentage"];
	[preferences registerBool:&wantsHiddenLabels default:NO forKey:@"wantsHiddenLabels"];
	[preferences registerBool:&wantsHiddenPageDots default:NO forKey:@"wantsHiddenPageDots"];
	[preferences registerBool:&wantsTransparentDock default:NO forKey:@"wantsTransparentDock"];
	[preferences registerBool:&hideFolderBackground default:NO forKey:@"hideFolderBackground"];
	[preferences registerBool:&wantsOlderNotifs default:NO forKey:@"wantsOlderNotifs"];
	[preferences registerBool:&wantsHomeBar default:NO forKey:@"wantsHomeBar"];
	[preferences registerBool:&noTodayHS default:NO forKey:@"noTodayHS"];
	[preferences registerBool:&noTodayLS default:NO forKey:@"noTodayLS"];
	[preferences registerBool:&wantsHapticScreenshot default:YES forKey:@"wantsHapticScreenshot"];
	[preferences registerBool:&wantsHapticVol default:NO forKey:@"wantsHapticVol"];
	[preferences registerBool:&noSpotlight default:NO forKey:@"noSpotlight"];
	[preferences registerBool:&reachChevron default:NO forKey:@"reachChevron"];
	[preferences registerBool:&reachTimer default:NO forKey:@"reachTimer"];
	[preferences registerFloat:&hapticPref default:1 forKey:@"hapticPref"];
	[preferences registerFloat:&volumePref default:0 forKey:@"volumePref"];
	[preferences registerFloat:&screenshotPref default:1 forKey:@"screenshotPref"];
}