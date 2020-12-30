/**
 * Mavalry : Mavalry.xm
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import "Mavalry.h"

%group BatteryPercentage
%hook _UIBatteryView

-(void)setShowsPercentage:(BOOL)arg1 {
	%orig(TRUE);
}

%end
%end

%group ReachTimer
%hook SBReachabilityManager

-(void)_setKeepAliveTimer {
	return;
}

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
    return FALSE;
}

-(BOOL)_allowsCapabilityTodayViewWithExplanation:(id*)arg1 {
    return FALSE;
}

%end
%end

%group HSnoToday
%hook SBRootFolderView

-(unsigned long long)_minusPageCount {
    return FALSE;
}

-(void)_layoutSubviewsForTodayView {
    %orig;
    [self todayViewController].view.hidden = FALSE;
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
	%orig(TRUE);
}
%end
%end

%group PageDots
%hook SBIconListPageControl

- (void)setHidden:(BOOL)arg1 {
    %orig(TRUE);
}

%end
%end

%group DockBG
%hook SBDockView
- (void)setBackgroundAlpha:(double)arg1 {
	%orig(0);
}

%end

%hook SBFloatingDockView

- (void)setBackgroundAlpha:(double)arg1 {
	%orig(0);
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
	self.hidden = TRUE;
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
	loadPrefs();
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("xyz.monotrix.mavalryprefs/ReloadPrefs"), NULL, CFNotificationSuspensionBehaviorCoalesce);
	if (isEnabled) {
		NSLog(@"[MAV] INJECTING TWEAK AT %f", [[NSDate date] timeIntervalSince1970]);
		if (moonGone) %init(DNDNotifs);
		if (wantsBatteryPercentage) %init(BatteryPercentage);
		if (wantsHiddenLabels) %init(HideLabels);
		if (wantsHiddenPageDots) %init(PageDots);
		if (wantsTransparentDock) %init(DockBG);
		if (hideFolderBackground) %init(FolderBG);
		if (wantsOlderNotifs) %init(OlderNotifs);
		if (wantsHomeBar) %init(HomeBar);
		if (noTodayHS) %init(HSnoToday);
		if (noTodayLS) %init(LSnoToday);
		if (wantsHapticScreenshot) %init(Screenshot);
		if (wantsHapticVol) %init(HapticVolume);
		if (volumePref != 0.0) %init(VolumeStep);
		if (noSpotlight) %init(HSnoSpotlight);
		if (reachChevron) %init(ReachChevron);
		if (reachTimer) %init(ReachTimer);
	} else {
		NSLog(@"[MAV] TWEAK IS NOT BEING INJECTED.");
	}
}
