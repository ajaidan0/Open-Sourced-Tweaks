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

-(void)viewDidLoad {
	[super viewDidLoad];
	MAVAppearanceSettings *appearanceSettings = [[MAVAppearanceSettings alloc] init];
    self.hb_appearanceSettings = appearanceSettings;
}

@end