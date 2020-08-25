#import "APRSetupController.h"

@implementation APRSetupController
-(void)loadView {
    [super loadView];
}

-(void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:28/255.f green:28/255.f blue:28/255.f alpha:1.0];
    UIButton *continueButton = [UIButton buttonWithType:UIButtonTypeSystem];
    continueButton.tintColor = [UIColor whiteColor];
    continueButton.backgroundColor = [UIColor colorWithRed:1 green:213/255.f blue:102/255.f alpha:1];
    [continueButton setTitle:@"Continue" forState:UIControlStateNormal];
    continueButton.layer.cornerRadius = 13;
    continueButton.layer.masksToBounds = YES;
    continueButton.frame = CGRectMake(15, self.view.frame.size.height - 110, self.view.bounds.size.width - 30, 60);
    continueButton.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    [self.view addSubview:continueButton];

    // UIImageView *
}

-(void)setWeather {

}

-(void)setTime {

}

-(void)setDate {

}

@end