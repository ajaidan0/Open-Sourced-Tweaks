/*
 * April : APRRootListController.m
 * 
 * Authored by ConstanzeDev and LacertosusDeus (c) 2020 
 * Maintained by ajaidan0 (c) 2020
*/

#import "APRRootListController.h"

@implementation APRRootListController
-(id)init {
	self = [super init];
	if(self) {
		HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
		appearanceSettings.tintColor = APRColorMain;
		appearanceSettings.navigationBarTintColor = APRColorMain;
		appearanceSettings.tableViewCellSeparatorColor = [UIColor clearColor];
		appearanceSettings.translucentNavigationBar = YES;
		self.hb_appearanceSettings = appearanceSettings;
	}
	return self;
}

-(void)ftiModal {
	[[UIApplication sharedApplication]
		openURL:[NSURL URLWithString:@"https://gist.github.com/Julz4455/d32ca229565781b6c7d63dcc15851812"]
		options:@{}
		completionHandler:nil];
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)viewDidLoad {
	[super viewDidLoad];
	
	// Adds Discord Plug in the top right of the preference pane.
	UIImage *discordIcon = [[UIImage alloc] initWithContentsOfFile:@"/Library/PreferenceBundles/aprilprefs.bundle/discord.png"];
    discordIcon = [UIImage imageWithCGImage:[discordIcon CGImage]
                                                    scale:(discordIcon.scale * 1.5)
                                                    orientation:(discordIcon.imageOrientation)];
	discordIcon = [discordIcon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	UIBarButtonItem *discordButton = [[UIBarButtonItem alloc] initWithImage:discordIcon style:UIBarButtonItemStylePlain target:self action:@selector(discord)];
	self.navigationItem.rightBarButtonItem = discordButton;
}

-(void)discord {
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://discord.gg/jgXJ2Mv"]
													  options:@{}
													  completionHandler:nil];
}

-(void)respring {
	pid_t pid;
	const char* args[] = {"sbreload", NULL};
	posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
}

-(void)activateWallpaperColors:(PSSpecifier *)specifier {
	PSTableCell *cell = [self cachedCellForSpecifier:specifier];
	cell.cellEnabled = NO;

	UIAlertController *wallpaperColorsAlert = [UIAlertController alertControllerWithTitle:@"April" message:@"Would you like to use the colors from your wallpaper for April?\n\nNote: This is not perfect.\n\nThis will replace the currently set colors for all labels.\n\nYou will also respring shortly after to apply the changes." preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Lets Do It!" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
		if([[NSFileManager defaultManager] fileExistsAtPath:@"/User/Library/SpringBoard/OriginalLockBackground.cpbitmap"]) {
			CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), CFSTR("com.constanze.aprilprefs-aprilUseWallpaperColors"), nil, nil , true);
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				cell.cellEnabled = YES;
			});
		} else {
			UIAlertController *errorAlert = [UIAlertController alertControllerWithTitle:@"Error" message:@"No lockscreen wallpaper was found at: /User/Library/SpringBoard/OriginalLockBackground.cpbitmap\n\nContact me for support" preferredStyle:UIAlertControllerStyleAlert];
			UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
				cell.cellEnabled = YES;
			}];
			[errorAlert addAction:cancelAction];
			[self presentViewController:errorAlert animated:YES completion:nil];
		}
	}];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Nah, Nevermind..." style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
		cell.cellEnabled = YES;
	}];
	[wallpaperColorsAlert addAction:confirmAction];
	[wallpaperColorsAlert addAction:cancelAction];
	[self presentViewController:wallpaperColorsAlert animated:YES completion:nil];
}

-(void)resetSettings:(PSSpecifier *)specifier {
	PSTableCell *cell = [self cachedCellForSpecifier:specifier];
	cell.cellEnabled = NO;

	UIAlertController *resetAlert = [UIAlertController alertControllerWithTitle:@"April" message:@"Would you like to use the colors from your wallpaper for April?\n\nThis may not supply the best colors for your lockscreen.\n\nThis will replace the currently set colors for all labels." preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Reset" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
		HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.aprilprefs"];
		[prefs removeAllObjects];
		pid_t pid;
		const char* args[] = {"sbreload", NULL};
		posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char* const*)args, NULL);
		cell.cellEnabled = YES;
	}];
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Uhh, Nevermind..." style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
		cell.cellEnabled = YES;
	}];
	[resetAlert addAction:confirmAction];
	[resetAlert addAction:cancelAction];
	[self presentViewController:resetAlert animated:YES completion:nil];
}

-(void)_returnKeyPressed:(id)arg1 {
	[self.view endEditing:YES];
}

@end