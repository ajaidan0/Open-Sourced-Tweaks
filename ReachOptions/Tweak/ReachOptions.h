/**
 * ReachOptions : ReachOptions.h
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import "Actions-Structs.h"
#import "UIDevice+notchedDevice.h"
#define PLIST_PATH @"/var/mobile/Library/Preferences/com.monotrix.reachoptionsprefs.plist"

@interface SBReachabilityManager : UIAlertController
-(void)_setKeepAliveTimer;
-(void)toggleReachability;
-(void)activateReachability:(id)arg1;
@end

BOOL isEnabled;
BOOL ss;
BOOL cc;
BOOL lock;
BOOL respring;
BOOL uicache;
BOOL wifi;
BOOL spotlight;
BOOL shouldCancel = FALSE;

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : NO;
    ss = [prefs objectForKey:@"1"] ? [[prefs objectForKey:@"1"] boolValue] : NO;
    cc = [prefs objectForKey:@"2"] ? [[prefs objectForKey:@"2"] boolValue] : NO;
    lock = [prefs objectForKey:@"3"] ? [[prefs objectForKey:@"3"] boolValue] : NO;
    respring = [prefs objectForKey:@"4"] ? [[prefs objectForKey:@"4"] boolValue] : NO;
    uicache = [prefs objectForKey:@"5"] ? [[prefs objectForKey:@"5"] boolValue] : NO;
    wifi = [prefs objectForKey:@"6"] ? [[prefs objectForKey:@"6"] boolValue] : NO;
    spotlight = [prefs objectForKey:@"7"] ? [[prefs objectForKey:@"7"] boolValue] : NO;
}
