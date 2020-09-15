/*
 * ReachOptions : Actions.x
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import "Actions-Structs.h"

@implementation ReachOptions

// Control Center action
+(void)ControlCenter {
    [[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
    return;
}

// Lock action
+(void)Lock {
    [(SpringBoard *)[UIApplication sharedApplication] _simulateLockButtonPress];
    return;
}

// Respring
+(void)Respring {
    NSTask *task = [NSTask new];
    task.launchPath = @"/usr/bin/killall";
    task.arguments = @[@"-9", @"SpringBoard"];
    [task launch];
    return;
}

// Screenshot
+(void)Screenshot {
    [(SpringBoard *)[UIApplication sharedApplication] takeScreenshot];
    return;
}

// Spotlight
+(void)Spotlight {
    [(AXSpringBoardServer *)[%c(AXSpringBoardServer) server] revealSpotlight];
    return;
}

// UICache
+(void)UICache {
    NSTask *task = [NSTask new];
    task.launchPath = @"/usr/bin/uicache";
    [task launch];  
    return;
}

// WiFi
+(void)WiFi {
    BOOL wiFiEnabled = [[%c(SBWiFiManager) sharedInstance] wiFiEnabled];
    [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:!wiFiEnabled];
    return;
}

@end
