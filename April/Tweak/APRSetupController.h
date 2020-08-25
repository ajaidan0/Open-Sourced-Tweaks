/*
 * April : APRSetupController.h
 * 
 * Authored by ConstanzeDev and LacertosusDeus (c) 2020 
 * Maintained by ajaidan0 (c) 2020
*/

#import <Cephei/HBPreferences.h>
#import <UIKit/UIKit.h>

@interface APRSetupController : UIViewController
@property (nonatomic, assign) BOOL useFTWeather;
@property (nonatomic, assign) BOOL useFTTime;
@property (nonatomic, assign) BOOL useFTDate;
-(void)setWeather;
-(void)setTime;
-(void)setDate;
@end