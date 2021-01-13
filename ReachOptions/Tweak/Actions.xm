/**
  * ReachOptions : Actions.xm
  *
  * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import "Actions-Structs.h"

@implementation ReachOptions

// Control Center action
+(void)ControlCenter {
    NSLog(@"[ROP] Control Center action called.");
    [[%c(SBControlCenterController) sharedInstance] presentAnimated:YES];
    return;
}

// Lock action
+(void)Lock {
    NSLog(@"[ROP] Lock action called.");
    [(SpringBoard *)[UIApplication sharedApplication] _simulateLockButtonPress];
    return;
}

// Respring
+(void)Respring {
    NSLog(@"[ROP] Respring action called.");
    NSTask *task = [NSTask new];
    task.launchPath = @"/usr/bin/killall";
    task.arguments = @[@"-9", @"SpringBoard"];
    [task launch];
    return;
}

// Screenshot
+(void)Screenshot {
    NSLog(@"[ROP] Screenshot action called.");
    [(SpringBoard *)[UIApplication sharedApplication] takeScreenshot];
    return;
}

// Spotlight
+(void)Spotlight {
    NSLog(@"[ROP] Spotlight action called.");
    [(AXSpringBoardServer *)[%c(AXSpringBoardServer) server] revealSpotlight];
    return;
}

// UICache
+(void)UICache {
    NSLog(@"[ROP] UICache action called.");
    NSTask *task = [NSTask new];
    task.launchPath = @"/usr/bin/uicache";
    [task launch];  
    return;
}

// WiFi
+(void)WiFi {
    NSLog(@"[ROP] WiFi action called.");
    BOOL wiFiEnabled = [[%c(SBWiFiManager) sharedInstance] wiFiEnabled];
    [[%c(SBWiFiManager) sharedInstance] setWiFiEnabled:!wiFiEnabled];
    return;
}

@end