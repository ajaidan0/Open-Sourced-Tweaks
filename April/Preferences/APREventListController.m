#import "APRRootListController.h"

@implementation APREventListController
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

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"APREventSettings" target:self];
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

-(void)_returnKeyPressed:(id)arg1 {
	[self.view endEditing:YES];
}

-(void)colorpicker {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.aprilprefs"];
	NSString *aprilLabelColor = [prefs objectForKey:@"aprilEventDetailColor"];

	UIColor *startColor = LCPParseColorString(aprilLabelColor, @"#FFFFFF");
	PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:YES];
	[alert displayWithCompletion:^void (UIColor *pickedColor) {
		NSString *hexColor = [UIColor hexFromColor:pickedColor];
		hexColor = [hexColor stringByAppendingFormat:@":%f", pickedColor.alpha];
		[prefs setObject:hexColor forKey:@"aprilEventDetailColor"];
	}];
}

-(void)titlecolorpicker {
	HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.aprilprefs"];
	NSString *aprilLabelColor = [prefs objectForKey:@"aprilEventTitleColor"];

	UIColor *startColor = LCPParseColorString(aprilLabelColor, @"#FFFFFF");
	PFColorAlert *alert = [PFColorAlert colorAlertWithStartColor:startColor showAlpha:YES];
	[alert displayWithCompletion:^void (UIColor *pickedColor) {
		NSString *hexColor = [UIColor hexFromColor:pickedColor];
		hexColor = [hexColor stringByAppendingFormat:@":%f", pickedColor.alpha];
		[prefs setObject:hexColor forKey:@"aprilEventTitleColor"];
	}];
}

-(NSArray *)calendarTitles {
	EKEventStore *ekStore = [[EKEventStore alloc] init];
    NSArray *allCalendars = [ekStore calendarsForEntityType:EKEntityTypeEvent];
    NSMutableArray *localCalendars = [[NSMutableArray alloc] init];
    for(int i=0;i<allCalendars.count;i++) {
        [localCalendars addObject:((EKCalendar*)[allCalendars objectAtIndex:i]).title];
    }
	return localCalendars;
}

@end