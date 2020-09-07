/*
 * Mavalry : Mavalry.h
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import <UIKit/UIControl.h>
#import <sys/utsname.h>
#import <AudioToolbox/AudioServices.h>
#import <spawn.h>
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

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

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : NO;
	wantsHomeBar = [prefs objectForKey:@"wantsHomeBar"] ? [[prefs objectForKey:@"wantsHomeBar"] boolValue] : NO;
    wantsOlderNotifs = [prefs objectForKey:@"wantsOlderNotifs"] ? [[prefs objectForKey:@"wantsOlderNotifs"] boolValue] : NO;
    wantsTransparentDock = [prefs objectForKey:@"wantsTransparentDock"] ? [[prefs objectForKey:@"wantsTransparentDock"] boolValue] : NO;
    wantsHiddenPageDots = [prefs objectForKey:@"wantsHiddenPageDots"] ? [[prefs objectForKey:@"wantsHiddenPageDots"] boolValue] : NO;
    wantsHiddenLabels = [prefs objectForKey:@"wantsHiddenLabels"] ? [[prefs objectForKey:@"wantsHiddenLabels"] boolValue] : NO;
    hideFolderBackground = [prefs objectForKey:@"hideFolderBackground"] ? [[prefs objectForKey:@"hideFolderBackground"] boolValue] : NO;
    moonGone = [prefs objectForKey:@"moonGone"] ? [[prefs objectForKey:@"moonGone"] boolValue] : NO;
    noTodayLS = [prefs objectForKey:@"noTodayLS"] ? [[prefs objectForKey:@"noTodayLS"] boolValue] : NO;
    noTodayHS = [prefs objectForKey:@"noTodayHS"] ? [[prefs objectForKey:@"noTodayHS"] boolValue] : NO;
    wantsHapticVol = [prefs objectForKey:@"wantsHapticVol"] ? [[prefs objectForKey:@"wantsHapticVol"] boolValue] : NO;
    wantsHapticScreenshot = [prefs objectForKey:@"wantsHapticScreenshot"] ? [[prefs objectForKey:@"wantsHapticScreenshot"] boolValue] : NO;
    noSpotlight = [prefs objectForKey:@"noSpotlight"] ? [[prefs objectForKey:@"noSpotlight"] boolValue] : NO;
	reachChevron = [prefs objectForKey:@"reachChevron"] ? [[prefs objectForKey:@"reachChevron"] boolValue] : NO;
	reachTimer = [prefs objectForKey:@"reachTimer"] ? [[prefs objectForKey:@"reachTimer"] boolValue] : NO;
	wantsBatteryPercentage = [prefs objectForKey:@"wantsBatteryPercentage"] ? [[prefs objectForKey:@"wantsBatteryPercentage"] boolValue] : NO;
    hapticPref = [[prefs objectForKey:@"hapticPref"] floatValue];
    screenshotPref = [[prefs objectForKey:@"screenshotPref"] floatValue];
    volumePref = [[prefs objectForKey:@"volumePref"] floatValue];
}