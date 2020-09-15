/*
 * ReachOptions : Actions-Structs.h
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import <Foundation/Foundation.h>
#include <unistd.h>

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

// Create "ReachOptions" class
@interface ReachOptions : NSObject
@end

// Reinterface ReachOptions as a private framework
@interface ReachOptions (Actions)
+(void)Screenshot;
+(void)ControlCenter;
+(void)Lock;
+(void)Respring;
+(void)Spotlight;
+(void)UICache;
+(void)WiFi;
@end


// Begin NSTask
@class NSURL, NSArray, NSDictionary;

@interface NSTask : NSObject
@property (copy) NSURL * executableURL; 
@property (copy) NSArray * arguments; 
@property (copy) NSDictionary * environment; 
@property (copy) NSURL * currentDirectoryURL; 
@property (retain) id standardInput; 
@property (retain) id standardOutput; 
@property (retain) id standardError; 
@property (readonly) int processIdentifier; 
@property (getter=isRunning,readonly) BOOL running; 
@property (readonly) int terminationStatus; 
@property (readonly) long long terminationReason; 
@property (copy) id terminationHandler; 
@property (assign) long long qualityOfService; 
+(id)currentTaskDictionary;
+(id)launchedTaskWithDictionary:(id)arg1 ;
+(id)launchedTaskWithLaunchPath:(id)arg1 arguments:(id)arg2 ;
+(id)launchedTaskWithExecutableURL:(id)arg1 arguments:(id)arg2 error:(out id*)arg3 terminationHandler:(/*^block*/id)arg4 ;
+(id)allocWithZone:(NSZone*)arg1 ;
-(NSURL *)executableURL;
-(id)currentDirectoryPath;
-(void)setArguments:(NSArray *)arg1 ;
-(void)setCurrentDirectoryPath:(id)arg1 ;
-(id)launchPath;
-(void)setLaunchPath:(id)arg1 ;
-(int)terminationStatus;
-(long long)terminationReason;
-(void)launch;
-(BOOL)launchAndReturnError:(id*)arg1 ;
-(void)setCurrentDirectoryURL:(NSURL *)arg1 ;
-(NSURL *)currentDirectoryURL;
-(void)setExecutableURL:(NSURL *)arg1 ;
-(void)interrupt;
-(long long)suspendCount;
-(void)setStandardInput:(id)arg1 ;
-(void)setStandardOutput:(id)arg1 ;
-(void)setStandardError:(id)arg1 ;
-(id)standardInput;
-(id)standardOutput;
-(id)standardError;
-(id)init;
-(NSDictionary *)environment;
-(BOOL)isRunning;
-(BOOL)suspend;
-(BOOL)resume;
-(void)setEnvironment:(NSDictionary *)arg1 ;
-(void)setQualityOfService:(long long)arg1 ;
-(void)setTerminationHandler:(id)arg1 ;
-(int)processIdentifier;
-(id)terminationHandler;
-(long long)qualityOfService;
-(void)terminate;
-(NSArray *)arguments;
@end
