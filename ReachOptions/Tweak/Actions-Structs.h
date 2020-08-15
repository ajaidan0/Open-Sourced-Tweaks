/*
 * ReachOptions : Actions-Structs.h
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import <Foundation/Foundation.h>
#include <unistd.h>
#include <spawn.h>

@interface SBControlCenterController
+(id)sharedInstance;
+(void)presentAnimated:(BOOL)arg1;
@end

@interface SpringBoard
-(void)_simulateLockButtonPress;
-(void)takeScreenshot;
@end

@interface SBWiFiManager
+(id)sharedInstance;
-(void)setWiFiEnabled:(BOOL)arg1;
-(BOOL)wiFiEnabled;
@end

@interface AXSpringBoardServer
+(id)server;
-(void)revealSpotlight;
@end

// Declare ReachOptions here so we can use a fancy (Actions) interface there
@interface ReachOptions : NSObject
@end

// Command interfaces
@interface ReachOptions (Actions)
+(void)Screenshot;
+(void)ControlCenter;
+(void)Lock;
+(void)Respring;
+(void)Spotlight;
+(void)UICache;
+(void)WiFi;
@end
