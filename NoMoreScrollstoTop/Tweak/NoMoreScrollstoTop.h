/**
 * ReachOptions : ReachOptions.h
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import <libSparkAppList/SparkAppList.h>
#define PLIST_PATH @"/var/mobile/Library/Preferences/xyz.monotrix.scrollsprefs.plist"

BOOL isEnabled;

static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : NO;
}

