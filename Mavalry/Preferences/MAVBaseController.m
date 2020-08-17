#import "MAVBaseController.h"

@implementation MAVBaseController
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

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:NSStringFromClass([self class]) target:self];
	}
	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIColor *tintColor = [UIColor colorWithRed: 0.60 green: 0.21 blue: 0.77 alpha: 1.00];
    [[[[self navigationController] navigationController] navigationBar] setTintColor:tintColor];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:1.0 animations:^{
        [[[[self navigationController] navigationController] navigationBar] setTintColor:nil];
    }];
}

-(void)discordLink {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://discord.gg/4C6E2eQ"] options:@{} completionHandler:nil];
}

-(void)sourceCode {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/ajaidan0/open-sourced-tweaks/tree/master/mavalry"] options:@{} completionHandler:nil];
}
@end