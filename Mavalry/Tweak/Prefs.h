#define PLIST_PATH @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist"

BOOL isEnabled;

// Booleans
BOOL wantsHomeBar;
BOOL wantsOlderNotifs;
BOOL wantsTransparentDock;
BOOL wantsHiddenPageDots; 
BOOL wantsHiddenLabels; 
BOOL hideFolderBackground;
BOOL moonGone;
BOOL noTodayLS;
BOOL noTodayHS;
BOOL noSpotlight;
BOOL wantsHapticVol;
BOOL wantsHapticScreenshot;
BOOL reachChevron;
BOOL reachTimer;
BOOL wantsBatteryPercentage;

// Floats
CGFloat hapticPref;
CGFloat volumePref;
CGFloat screenshotPref;

static void loadPrefs() {
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
    isEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : NO;
    moonGone = [prefs objectForKey:@"moonGone"] ? [[prefs objectForKey:@"moonGone"] boolValue] : NO;
    wantsBatteryPercentage = [prefs objectForKey:@"wantsHiddenPercentage"] ? [[prefs objectForKey:@"wantsHiddenPercentage"] boolValue] : NO;
    wantsHiddenLabels = [prefs objectForKey:@"wantsHiddenLabels"] ? [[prefs objectForKey:@"wantsHiddenLabels"] boolValue] : NO;
    hideFolderBackground = [prefs objectForKey:@"hideFolderBackground"] ? [[prefs objectForKey:@"hideFolderBackground"] boolValue] : NO;
    wantsTransparentDock = [prefs objectForKey:@"wantsTransparentDock"] ? [[prefs objectForKey:@"wantsTransparentDock"] boolValue] : NO;
    wantsOlderNotifs = [prefs objectForKey:@"wantsOlderNotifs"] ? [[prefs objectForKey:@"wantsOlderNotifs"] boolValue] : NO;
    wantsHomeBar = [prefs objectForKey:@"wantsHomeBar"] ? [[prefs objectForKey:@"wantsHomeBar"] boolValue] : NO;
    noTodayHS = [prefs objectForKey:@"noTodayHS"] ? [[prefs objectForKey:@"noTodayHS"] boolValue] : NO;
    noTodayLS = [prefs objectForKey:@"noTodayLS"] ? [[prefs objectForKey:@"noTodayLS"] boolValue] : NO;
    wantsHapticScreenshot = [prefs objectForKey:@"wantsHapticScreenshot"] ? [[prefs objectForKey:@"wantsHapticScreenshot"] boolValue] : NO;
    wantsHapticVol = [prefs objectForKey:@"wantsHapticVol"] ? [[prefs objectForKey:@"wantsHapticVol"] boolValue] : NO;
    noSpotlight = [prefs objectForKey:@"noSpotlight"] ? [[prefs objectForKey:@"noSpotlight"] boolValue] : NO;
    reachChevron = [prefs objectForKey:@"reachChevron"] ? [[prefs objectForKey:@"reachChevron"] boolValue] : NO;
    reachTimer = [prefs objectForKey:@"reachTimer"] ? [[prefs objectForKey:@"reachTimer"] boolValue] : NO;
    hapticPref = [[prefs objectForKey:@"hapticPref"] floatValue];
    volumePref = [[prefs objectForKey:@"volumePref"] floatValue];
    screenshotPref = [[prefs objectForKey:@"screenshotPref"] floatValue];
}