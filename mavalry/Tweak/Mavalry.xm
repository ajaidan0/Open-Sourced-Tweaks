// Mavalry v-2.0.2 b1
// Copyright (c) ajaidan0 2020

#import "Mavalry.h"

%group BatteryPercentage
%hook _UIBatteryView

-(void)setShowsPercentage:(BOOL)arg1 {
	arg1 = TRUE;
	return %orig(arg1);
}

%end
%end

%group ReachTimer
%hook SBReachabilityManager

-(void)_setKeepAliveTimer {}

%end
%end

%group ReachChevron
%hook SBReachabilityBackgroundView

-(void)_setupChevron {
	return;
}

-(void)_updateChevronPathForUpFraction:(double)arg1 {
	return;
}

%end
%end

%group LSnoToday
%hook SBMainDisplayPolicyAggregator

-(BOOL)_allowsCapabilityLockScreenTodayViewWithExplanation:(id*)arg1 {
    return false;
}

-(BOOL)_allowsCapabilityTodayViewWithExplanation:(id*)arg1 {
    return false;
}

%end
%end

%group HSnoToday
%hook SBRootFolderView

-(unsigned long long)_minusPageCount {
    return false;
}

-(void)_layoutSubviewsForTodayView {
    %orig;
    [self todayViewController].view.hidden = false;
}

-(void)beginPageStateTransitionToState:(long long)arg1 animated:(BOOL)arg2 interactive:(BOOL)arg3  {
    if (arg1 == 2) return; 
    %orig;
}

%end
%end

%group HSnoSpotlight
%hook SBRootFolderView

-(void)beginPageStateTransitionToState:(long long)arg1 animated:(BOOL)arg2 interactive:(BOOL)arg3  {
    if (arg1 == 3) return; 
    %orig;
}

%end
%end

%group DNDNotifs
%hook DNDNotificationsService

-(id)initWithClientIdentifier:(id)arg1 {
    return nil;
}
%end
%end

%group HideLabels
%hook SBIconView
- (void)setLabelHidden:(BOOL)arg1 {
	arg1 = YES;
	%orig(arg1);
}
%end
%end

%group PageDots
%hook SBIconListPageControl
- (void)setHidden:(BOOL)arg1 {
    %orig(YES);
}
%end
%end

%group DockBG
%hook SBDockView
- (void)setBackgroundAlpha:(double)arg1 {
	arg1 = 0;
	%orig(arg1);
}
%end
%hook SBFloatingDockView
-(UIView *)backgroundView {
	return nil;
}
%end
%end

%group FolderBG 
%hook SBFolderBackgroundView
- (id)initWithFrame:(struct CGRect)arg1{
	return NULL;
}
%end

%hook SBFolderIconImageView
 - (void)setBackgroundView : (UIView *)backgroundView {}
%end
%end

%group OlderNotifs
%hook NCNotificationListSectionRevealHintView
-(void)setFrame:(CGRect)arg1 {
	self.hidden = YES;
	%orig;
}
%end
%end

%group HomeBar
%hook MTLumaDodgePillSettings
- (void)setHeight:(double)arg1 {
	arg1 = 0;
	%orig(arg1);
}

%end
%end

%group Screenshot
%hook SpringBoard
-(void)takeScreenshot {
	%orig;
	if (screenshotPref == 1) {
		AudioServicesPlaySystemSound(1519); // light
	} else if (screenshotPref == 2) {
		AudioServicesPlaySystemSound(1520); // medium
	} else if (screenshotPref == 3) {
		AudioServicesPlaySystemSound(1521); // strong
	}
}
%end
%end

%group HapticVolume
%hook SBVolumeControl 
- (void)increaseVolume {
	%orig;		
	if (hapticPref == 1) {
		AudioServicesPlaySystemSound(1519); // light
	} else if (hapticPref == 2) {
		AudioServicesPlaySystemSound(1520); // medium
	} else if (hapticPref == 3) {
		AudioServicesPlaySystemSound(1521); // strong
	}	
}
- (void)decreaseVolume {
	%orig;	
	if (hapticPref == 1) {
		AudioServicesPlaySystemSound(1519); // light
	} else if (hapticPref == 2) {
		AudioServicesPlaySystemSound(1520); // medium
	} else if (hapticPref == 3) {
		AudioServicesPlaySystemSound(1521); // strong
	}
}
%end
%end

%group VolumeStep
%hook SBVolumeControl
- (float)volumeStepUp {
    return (volumePref); //possible values from 0.01 -> 1.0 
}
- (float)volumeStepDown {
    return (volumePref);
}
%end
%end

// Loads prefs and inits
%ctor {
	RLog(@"------");
	RLog(@"Tweak is loading.");
	%init;
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
	if (isEnabled) {
		RLog(@"Tweak is enabled.");
		if (moonGone) %init(DNDNotifs); else {}
		if (moonGone) RLog(@"moonGone is enabled."); else {RLog(@"moonGone is disabled.");}
		if (wantsBatteryPercentage) %init(BatteryPercentage); else {}
		if (wantsBatteryPercentage) RLog(@"wantsBatteryPercentage is enabled."); else {RLog(@"wantsBatteryPercentage is disabled.");}
		if (wantsHiddenLabels) %init(HideLabels); else {}
		if (wantsHiddenLabels) RLog(@"wantsHiddenLabels is enabled."); else {RLog(@"wantsHiddenLabels is disabled.");}
		if (wantsHiddenPageDots) %init(PageDots); else {}
		if (wantsHiddenPageDots) RLog(@"wantsHiddenPageDots is enabled."); else {RLog(@"wantsHiddenPageDots is disabled.");}
		if (wantsTransparentDock) %init(DockBG); else {}
		if (wantsTransparentDock) RLog(@"wantsTransparentDock is enabled."); else {RLog(@"wantsTransparentDock is disabled.");}
		if (hideFolderBackground) %init(FolderBG); else {}
		if (hideFolderBackground) RLog(@"hideFolderBackground is enabled."); else {RLog(@"hideFolderBackground is disabled.");}
		if (wantsOlderNotifs) %init(OlderNotifs); else {}
		if (wantsOlderNotifs) RLog(@"wantsOlderNotifs is enabled."); else {RLog(@"wantsOlderNotifs is disabled.");}
		if (wantsHomeBar) %init(HomeBar); else {}
		if (wantsHomeBar) RLog(@"wantsHomeBar is enabled."); else {RLog(@"wantsHomeBar is disabled.");}
		if (noTodayHS) %init(HSnoToday); else {}
		if (noTodayHS) RLog(@"noTodayHS is enabled."); else {RLog(@"noTodayHS is disabled.");}
		if (noTodayLS) %init(LSnoToday); else {}
		if (noTodayLS) RLog(@"noTodayLS is enabled."); else {RLog(@"noTodayLS is disabled.");}
		if (wantsHapticScreenshot) %init(Screenshot); else {}
		if (wantsHapticScreenshot) RLog(@"wantsHapticScreenshot is enabled."); else {RLog(@"wantsHapticScreenshot is disabled.");}
		if (wantsHapticVol) %init(HapticVolume); else {}
		if (wantsHapticVol) RLog(@"wantsHapticVol is enabled."); else {RLog(@"wantsHapticVol is disabled.");}
		if (volumePref != 0.0) %init(VolumeStep); else {}
		if (noSpotlight) %init(HSnoSpotlight); else {}
		if (noSpotlight) RLog(@"noSpotlight is enabled."); else {RLog(@"noSpotlight is disabled.");}
		if (reachChevron) %init(ReachChevron) else {}
		if (reachChevron) RLog(@"reachChevron is enabled."); else {RLog(@"reachChevron is disabled.");}
		if (reachTimer) %init(ReachTimer) else {}
		if (reachTimer) RLog(@"reachTimer is enabled."); else {RLog(@"reachTimer is disabled.");}
	} else {
		RLog(@"Tweak is disabled.");
	}
	RLog(@"------");
	RLog(@"");
}
