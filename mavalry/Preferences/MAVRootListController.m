#include "MAVRootListController.h"

@interface MAVSwitchCell : PSSwitchTableCell
-(UIColor *)colorFromHex:(NSString *)hex withAlpha:(CGFloat)alpha;
@end

@implementation MAVSwitchCell {
  UIColor *_switchColor;
}

  -(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)identifier specifier:(PSSpecifier *)specifier {
    self = [super initWithStyle:style reuseIdentifier:identifier specifier:specifier];

    if(self) {
      ((UISwitch *)self.control).onTintColor = [self colorFromHex:[specifier propertyForKey:@"switchColor"] withAlpha:[[specifier propertyForKey:@"switchColorAlpha"] floatValue]];
    }

    return self;
  }

  -(UIColor *)colorFromHex:(NSString *)hex withAlpha:(CGFloat)alpha {   
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hex];
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    [scanner scanHexInt:&rgbValue];

    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0x00FF00) >> 8)) / 255.0 blue:((float)((rgbValue & 0x0000FF) >> 0)) / 255.0 alpha:alpha];
  }
@end

@interface OBButtonTray : UIView
- (void)addButton:(id)arg1;
- (void)addCaptionText:(id)arg1;;
@end

@interface OBBoldTrayButton : UIButton
-(void)setTitle:(id)arg1 forState:(unsigned long long)arg2;
+(id)buttonWithType:(long long)arg1;
@end

@interface OBWelcomeController : UIViewController
- (OBButtonTray *)buttonTray;
- (id)initWithTitle:(id)arg1 detailText:(id)arg2 icon:(id)arg3;
- (void)addBulletedListItemWithTitle:(id)arg1 description:(id)arg2 image:(id)arg3;
@end

OBWelcomeController *welcomeController; // Declaring this here outside of a method will allow the use of it later, such as dismissing.

@implementation SB

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"SB" target:self];
	}
	return _specifiers;
}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end

@implementation Lockscreen

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Lockscreen" target:self];
	}
	return _specifiers;
}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end

@implementation Applications

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Applications" target:self];
	}
	return _specifiers;
}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end

@implementation Reddit

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Reddit" target:self];
	}
	return _specifiers;
}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end

@implementation Haptics

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Haptics" target:self];
	}
	return _specifiers;
}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end

@implementation Reachability

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Reachability" target:self];
	}
	return _specifiers;
}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end

@implementation Creds

- (id)specifiers {
	if(_specifiers == nil) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Creds" target:self];
	}
	return _specifiers;
}

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end

@implementation MAVRootListController

-(void)respring {
	[HBRespringController respringAndReturnTo:[NSURL URLWithString:@"prefs:root=Mavalry"]];
}

- (void)confirmPrompt {
	AudioServicesPlaySystemSound(1520);
	UIAlertController *confirmAlert = [UIAlertController alertControllerWithTitle:@"Mavalry"
	message:@"Mavalry now needs to respring to enact the tweak changes."
	preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
		[self  respring];
	}];

	[confirmAlert addAction:confirmAction];

	AudioServicesPlaySystemSound(1520);
	[self presentViewController:confirmAlert animated:YES completion:nil];
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}
	return _specifiers;
}

-(id)init {
	self = [super init];
	if(self) {
		_respringApplyButton = (_respringApplyButton) ?: [[UIBarButtonItem alloc] initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(respring)];
		_respringApplyButton.tintColor = [UIColor whiteColor];
		[self.navigationItem setRightBarButtonItem:_respringApplyButton animated:YES];

	}
	return self;
}

// All credits to Simalary (Chris) and GalacticDev

-(void)setupWelcomeController {
	welcomeController = [[OBWelcomeController alloc] initWithTitle:@"Mavalry" detailText:@"The ultimate iOS customization tweak." icon:[UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/mavalryprefs.bundle/icon.png"]];

	[welcomeController addBulletedListItemWithTitle:@"Simple" description:@"Made with simplicity in mind." image:[UIImage systemImageNamed:@"gear"]];
	[welcomeController addBulletedListItemWithTitle:@"Elegant" description:@"Built to fullfill its purpose easily." image:[UIImage systemImageNamed:@"gear"]];
	[welcomeController addBulletedListItemWithTitle:@"Optimized" description:@"Extensively tested for battery drain." image:[UIImage systemImageNamed:@"gear"]];
	[welcomeController.buttonTray addCaptionText:@"Made with ❤️ by ajaidan0."];

	OBBoldTrayButton* continueButton = [OBBoldTrayButton buttonWithType:1];
	[continueButton addTarget:self action:@selector(dismissWelcomeController) forControlEvents:UIControlEventTouchUpInside];
	[continueButton setTitle:@"Continue" forState:UIControlStateNormal];
	[continueButton setClipsToBounds:YES];
	[continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal]; 
	[continueButton.layer setCornerRadius:15]; 
	[welcomeController.buttonTray addButton:continueButton];

	welcomeController.modalPresentationStyle = UIModalPresentationPageSheet; 
	welcomeController.modalInPresentation = YES; 
	welcomeController.view.tintColor = [UIColor colorWithRed: 0.57 green: 0.22 blue: 0.85 alpha: 1.00];
	[self presentViewController:welcomeController animated:YES completion:nil]; 
}

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
	NSString *path = @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist";
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	NSNumber *didShowOBWelcomeController = [settings valueForKey:@"didShowOBWelcomeController"] ?: @0;
	if([didShowOBWelcomeController isEqual:@0]){
		[self setupWelcomeController];
	}
}

-(void)dismissWelcomeController {
	NSString *path = @"/var/mobile/Library/Preferences/com.ajaidan.mavalryprefs.plist";
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	[settings addEntriesFromDictionary:[NSDictionary dictionaryWithContentsOfFile:path]];
	[settings setObject:@1 forKey:@"didShowOBWelcomeController"];
	[settings writeToFile:path atomically:YES];
	AudioServicesPlaySystemSound(1520);
	[welcomeController dismissViewControllerAnimated:YES completion:nil];
}
@end