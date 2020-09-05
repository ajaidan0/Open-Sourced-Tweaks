/*
 * ReachOptions : ReachOptions.h
 *
 * Copyright (c) ajaidan0 2020 (https://github.com/ajaidan0)
*/

#import <Cephei/HBPreferences.h>
#import "Actions-Structs.h"
#import "UIDevice+notchedDevice.h"

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
