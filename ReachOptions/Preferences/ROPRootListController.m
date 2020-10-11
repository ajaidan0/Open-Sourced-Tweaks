/**
 * ReachOptions : ROPRootListController.m
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#include "ROPRootListController.h"

@implementation ROPRootListController

- (id)readPreferenceValue:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	return (settings[specifier.properties[@"key"]]) ?: specifier.properties[@"default"];
}

- (void)setPreferenceValue:(id)value specifier:(PSSpecifier*)specifier {
	NSString *path = [NSString stringWithFormat:@"/User/Library/Preferences/%@.plist", specifier.properties[@"defaults"]];
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:value forKey:specifier.properties[@"key"]];
	[settings writeToFile:path atomically:YES];
	CFStringRef notificationName = (__bridge CFStringRef)specifier.properties[@"PostNotification"];
	if (notificationName) {
		CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), notificationName, NULL, NULL, YES);
	}
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

- (void)sourceLink {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/Monotrix/Open-Sourced-Tweaks/tree/master/ReachOptions"] options:@{} completionHandler:nil];
}

- (void)discordLink {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://discord.gg/hhRHwWp"] options:@{} completionHandler:nil];
}

- (void)viewDidLoad {
	[super viewDidLoad];
  	UIBarButtonItem *respringButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Apply"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(respring)];
	self.navigationItem.rightBarButtonItem = respringButton;
}

-(void)respring {
	NSURL *returnURL = [NSURL URLWithString:@"prefs:root=ReachOptions"]; 
  	SBSRelaunchAction *restartAction;
  	restartAction = [NSClassFromString(@"SBSRelaunchAction") actionWithReason:@"RestartRenderServer" options:SBSRelaunchActionOptionsFadeToBlackTransition targetURL:returnURL];
  	[[NSClassFromString(@"FBSSystemService") sharedService] sendActions:[NSSet setWithObject:restartAction] withResult:nil];
}

@end
