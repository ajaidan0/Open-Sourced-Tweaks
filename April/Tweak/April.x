/*
 * April : April.x
 * 
 * Authored by ConstanzeDev and LacertosusDeus (c) 2020 
 * Maintained by ajaidan0 (c) 2020
*/

#import "April.h"

%group iOS12

%hook SBDashBoardViewController
-(void)_transitionChargingViewToVisible:(BOOL)arg1 showBattery:(BOOL)arg2 animated:(BOOL)arg3 {
  if(arg2) {
    [lockScreenDateView fadeOutAprilWithDuration:1.5 withDelay:0];
    %orig;
    [lockScreenDateView fadeInAprilWithDuration:1.25 withDelay:2.5];
  } else {
    %orig;
  }
}
-(BOOL)_isWakeAnimationInProgress {
  if(YES && (int)aprilWeatherUpdateTime == 0) {
    [lockScreenDateView updateWeatherForCity];
  }
  return %orig;
}
%end

%hook SBDashBoardViewBase
-(void)layoutSubviews {
  if(lockScreenDateViewGesture == nil && lockScreenDateView != nil) {
    touchView = [[UIView alloc] initWithFrame:lsFrame];
    touchView.userInteractionEnabled = true;
    [self addSubview:touchView];
    addedView = true;

    lockScreenDateViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleAlignmentTap)];
    lockScreenDateViewGesture.numberOfTapsRequired = 2;
    [touchView addGestureRecognizer:lockScreenDateViewGesture];
  }
}
%new
-(void)handleAlignmentTap {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"com.april.handleAlignment" object:nil userInfo:nil];
}
%end

%hook SBDashBoardMainPageView
-(void)layoutSubviews {
  %orig;
  if(shouldRealignViews)
    return;
  if(aprilEventLabelSwitch)
    [self setFrame:CGRectMake(self.frame.origin.x, 45, self.frame.size.width, self.frame.size.height)];
  else
    [self setFrame:CGRectMake(self.frame.origin.x, 25, self.frame.size.width, self.frame.size.height)];
}
%end

%hook SBPagedScrollView
  - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
      [lockScreenDateView spacingWithOffset:scrollView];
  }

  -(void)layoutSubviews {
    %orig;
    shouldRealignViews = self.currentPageIndex == 1 ? NO : YES;
    if((self._keyboardOrientation == 3 || self._keyboardOrientation == 4)) {
      if(self.currentPageIndex == 0) {
        [lockScreenDateView fadeOutOthersWithDuration:0.3 withDelay:0];
        [lockScreenDateView setAlignment:2];
      } else {
        [lockScreenDateView fadeInOthersWithDuration:0.3 withDelay:0];
        if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
          [lockScreenDateView setAlignment:(int)aprilAlignment];
      }

    } else {
      if(self.currentPageIndex == 0) {
        [lockScreenDateView fadeOutOthersWithDuration:0.3 withDelay:0];
        [lockScreenDateView setAlignment:0];
      } else {
        [lockScreenDateView fadeInOthersWithDuration:0.3 withDelay:0];
        [lockScreenDateView setAlignment:(int)aprilAlignment];
      }
    }
  }
%end

%end

%group iOS13

%hook SBFPagedScrollView
  - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
      [lockScreenDateView spacingWithOffset:scrollView];
  }

  -(void)layoutSubviews {
    %orig;
    shouldRealignViews = NO;
    if((self._keyboardOrientation == 3 || self._keyboardOrientation == 4)) {
      if(self.currentPageIndex == 0) {
        [lockScreenDateView fadeOutOthersWithDuration:0.3 withDelay:0];
        [lockScreenDateView setAlignment:2];
      } else {
        [lockScreenDateView fadeInOthersWithDuration:0.3 withDelay:0];
        if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
          [lockScreenDateView setAlignment:(int)aprilAlignment];
      }

    } else {
      if(self.currentPageIndex == 0) {
        [lockScreenDateView fadeOutOthersWithDuration:0.3 withDelay:0];
        [lockScreenDateView setAlignment:0];
      } else {
        [lockScreenDateView fadeInOthersWithDuration:0.3 withDelay:0];
        [lockScreenDateView setAlignment:(int)aprilAlignment];
      }
    }
  }
%end

%hook CSCoverSheetViewController
-(void)_transitionChargingViewToVisible:(BOOL)args1 showBattery:(BOOL)arg2 animated:(BOOL)arg3 {
  if(arg2) {
    [lockScreenDateView fadeOutAprilWithDuration:1.5 withDelay:0];
    %orig;
    [lockScreenDateView fadeInAprilWithDuration:1.25 withDelay:2.5];
  } else {
    %orig;
  }
}
-(BOOL)_isWakeAnimationInProgress {
  if(YES && (int)aprilWeatherUpdateTime == 0) {
    [lockScreenDateView updateWeatherForCity];
  }
  return %orig;
}
%end

%hook CSCoverSheetViewBase
-(void)layoutSubviews {
  if(lockScreenDateViewGesture == nil && lockScreenDateView != nil) {
    touchView = [[UIView alloc] initWithFrame:lsFrame];
    touchView.userInteractionEnabled = true;
    [self addSubview:touchView];
    addedView = true;

    lockScreenDateViewGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleAlignmentTap)];
    lockScreenDateViewGesture.numberOfTapsRequired = 2;
    [touchView addGestureRecognizer:lockScreenDateViewGesture];
  }
}
%new
-(void)handleAlignmentTap {
  [[NSNotificationCenter defaultCenter] postNotificationName:@"com.april.handleAlignment" object:nil userInfo:nil];
}
%end

%hook CSMainPageView
-(void)layoutSubviews {
  %orig;
  if(shouldRealignViews)
    return;
  if(aprilEventLabelSwitch)
    [self setFrame:CGRectMake(self.frame.origin.x, 45, self.frame.size.width, self.frame.size.height)];
  else
    [self setFrame:CGRectMake(self.frame.origin.x, 25, self.frame.size.width, self.frame.size.height)];
}
%end

%end

%group All

%hook WATodayPadView
-(id)init {
  return weatherPadView = %orig;
}
%end

%hook SBFLockScreenDateView
  -(void)layoutSubviews {
    if(aprilEventLabelSwitch)
      lsFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y-65, self.frame.size.width, self.frame.size.height);
    else
      lsFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y-45, self.frame.size.width, self.frame.size.height);
    %orig;
  }
  -(id)initWithFrame:(CGRect)arg1 {
    [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(updateWeatherForCity) userInfo:nil repeats:NO];

    if(aprilWeatherUpdateTime > 0) {
      [NSTimer scheduledTimerWithTimeInterval:(aprilWeatherUpdateTime * 60) target:self selector:@selector(updateWeatherForCity) userInfo:nil repeats:YES];
    }

    if(aprilChargingInformation) {
      [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryStateChanged:) name:UIDeviceBatteryStateDidChangeNotification object:nil];
    }

    return lockScreenDateView = %orig;
  }

  -(void)didMoveToSuperview {
    SBUILegibilityLabel *_timeLabel = [self _timeLabel];
    UIView *_dateView = [self valueForKey:@"_dateSubtitleView"];
    if(!aprilPreserveKalm) {
      _timeLabel.hidden = YES;
      _dateView.hidden = YES;
    }
    %orig;

    [self setupApril];
  }

  -(void)_updateLabels {
    %orig;
    [self updateClockAndDateLabel];
  }

  -(void)setCustomSubtitleView:(SBFLockScreenDateSubtitleView *)arg1 {
    %orig(nil);
  }

%property (retain) UIStackView *aprilStackView;
%property (retain) UIStackView *eventStackView;
%property (retain) UIStackView *weatherStackView;
%property (retain) UIImageView *weatherConditionImage;
%property (retain) UIView      *fillerView;
%property (retain) UILabel     *timeLabel;
%property (retain) UILabel     *dateLabel;
%property (retain) UILabel     *weatherLabel;
%property (retain) UILabel     *eventTitle;
%property (retain) UILabel     *eventDetails;
%new
  -(void)setupApril {
    if(!self.timeLabel) {
      self.timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
      [self.timeLabel setFont:[UIFont systemFontOfSize:aprilTimeLabelSize weight:aprilTimeLabelWeight]];
      [self.timeLabel setNumberOfLines:1];
      [self.timeLabel setText:@""];
      [self.timeLabel setTranslatesAutoresizingMaskIntoConstraints:NO];

      self.dateLabel = [[UILabel alloc] initWithFrame:CGRectZero];
      [self.dateLabel setFont:[UIFont systemFontOfSize:aprilDateLabelSize weight:aprilDateLabelWeight]];
      [self.dateLabel setNumberOfLines:1];
      [self.dateLabel setText:@""];
      [self.dateLabel setTranslatesAutoresizingMaskIntoConstraints:NO];

      self.weatherLabel = [[UILabel alloc] initWithFrame:CGRectZero];
      [self.weatherLabel setFont:[UIFont systemFontOfSize:aprilWeatherLabelSize weight:aprilWeatherLabelWeight]];
      [self.weatherLabel setNumberOfLines:1];
      [self.weatherLabel setText:@""];
      [self.weatherLabel setContentHuggingPriority:1000 forAxis:UILayoutConstraintAxisHorizontal];
      [self.weatherLabel setTranslatesAutoresizingMaskIntoConstraints:NO];

      self.weatherConditionImage = [[UIImageView alloc] initWithFrame:CGRectZero];
      self.weatherConditionImage.contentMode = UIViewContentModeScaleAspectFit;
      self.weatherConditionImage.translatesAutoresizingMaskIntoConstraints = NO;
      [self.weatherConditionImage setContentHuggingPriority:1000 forAxis:UILayoutConstraintAxisHorizontal];

      self.weatherStackView = [[UIStackView alloc] init];
      self.weatherStackView.axis = UILayoutConstraintAxisHorizontal;
      self.weatherStackView.alignment = UIStackViewAlignmentCenter;
      self.weatherStackView.distribution = UIStackViewDistributionFill;
      self.weatherStackView.spacing = 0;
      self.weatherStackView.translatesAutoresizingMaskIntoConstraints = NO;

      self.fillerView = [[UIView alloc] initWithFrame:CGRectZero];
      self.fillerView.tag = 2007;
      self.fillerView.translatesAutoresizingMaskIntoConstraints = NO;
      [self.fillerView setContentHuggingPriority:1 forAxis:UILayoutConstraintAxisHorizontal];

      [self.weatherStackView addArrangedSubview:self.fillerView];
      [self.weatherStackView addArrangedSubview:self.weatherLabel];
      [self.weatherStackView addArrangedSubview:self.weatherConditionImage];

      self.aprilStackView = [[UIStackView alloc] init];
      self.aprilStackView.axis = UILayoutConstraintAxisVertical;
      self.aprilStackView.distribution = UIStackViewDistributionEqualSpacing;
      self.aprilStackView.spacing = 0;
      self.aprilStackView.translatesAutoresizingMaskIntoConstraints = NO;

      self.eventStackView = [[UIStackView alloc] init];
      self.eventStackView.axis = UILayoutConstraintAxisVertical;
      self.eventStackView.distribution = UIStackViewDistributionEqualSpacing;
      self.eventStackView.spacing = 0;
      self.eventStackView.translatesAutoresizingMaskIntoConstraints = NO;

      self.eventTitle = [[UILabel alloc] initWithFrame:CGRectZero];
      [self.eventTitle setFont:[UIFont systemFontOfSize:aprilEventTitleSize weight:aprilEventTitleWeight]];
      [self.eventTitle setNumberOfLines:1];
      [self.eventTitle setText:@""];
      [self.eventTitle setTranslatesAutoresizingMaskIntoConstraints:NO];

      self.eventDetails = [[UILabel alloc] initWithFrame:CGRectZero];
      [self.eventDetails setFont:[UIFont systemFontOfSize:aprilEventDetailSize weight:aprilEventDetailWeight]];
      [self.eventDetails setNumberOfLines:0];
      [self.eventDetails setText:@""];
      [self.eventDetails setTranslatesAutoresizingMaskIntoConstraints:NO];

      [self.eventStackView addArrangedSubview:self.eventTitle];
      [self.eventStackView addArrangedSubview:self.eventDetails];

      [self.aprilStackView addArrangedSubview:self.weatherStackView];
      [self.aprilStackView addArrangedSubview:self.timeLabel];
      [self.aprilStackView addArrangedSubview:self.dateLabel];
      [self.aprilStackView addArrangedSubview:self.eventStackView];
      [self addSubview:self.aprilStackView];
      
      [self.timeLabel.topAnchor constraintEqualToAnchor:self.weatherStackView.bottomAnchor constant:-7.5].active = YES;
      [self.timeLabel.bottomAnchor constraintEqualToAnchor:self.dateLabel.topAnchor constant:7.5].active = YES;
      [self.eventStackView.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor constant:5].active = YES;
      [self.eventDetails.topAnchor constraintEqualToAnchor:self.eventTitle.bottomAnchor constant:5].active = YES;

      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(alignmentWithGesture) name:@"com.april.handleAlignment" object:nil];
      [self preferencesChanged];
      [pagedScrollView layoutSubviews];
    }
  }

%new
  -(void)alignmentWithGesture {
    HBPreferences *prefs = [[HBPreferences alloc] initWithIdentifier:@"com.constanze.aprilprefs"];
    switch((int)aprilAlignment) {
      // Left
      case 0:
      aprilAlignment = 1;
      break;
      // Center
      case 1:
      aprilAlignment = 2;
      break;
      // Right
      case 2:
      aprilAlignment = 0;
      break;
    }
    [prefs setInteger:aprilAlignment forKey:@"aprilAlignment"];
    [self setAlignment:(int)aprilAlignment];
  }

%new
  -(void)updateEventsLabel {
    if(self.eventTitle && self.eventDetails) {
      if(aprilEventLabelSwitch) {
        self.eventTitle.text = @"Up Next";
        EKEventStore *ekStore = [[EKEventStore alloc] init];
        NSArray *allCalendars = [ekStore calendarsForEntityType:EKEntityTypeEvent];
        NSMutableArray *localCalendars = [[NSMutableArray alloc] init];
        for(int i=0;i<allCalendars.count;i++) {
          EKCalendar *currentCalendar = [allCalendars objectAtIndex:i];
          if(currentCalendar.title == aprilEventCalendarTitle) {
            [localCalendars addObject:currentCalendar];
          }
        }
        if(localCalendars.count < 1) {
          self.eventDetails.text = @"No Upcoming Events";
          return;
        }
        NSArray *finalEventsArr;
        for(int i=0;i<localCalendars.count;i++) {
          EKCalendar *cal = [localCalendars objectAtIndex:i];
          int yearSeconds = 365 * (60 * 60 * 24);
          NSArray *calendarsArray = @[cal];
          NSPredicate *predicate = [ekStore predicateForEventsWithStartDate:[NSDate dateWithTimeIntervalSinceNow:0] endDate:[NSDate dateWithTimeIntervalSinceNow:yearSeconds] calendars:calendarsArray];
          NSArray *eventsArray = [ekStore eventsMatchingPredicate:predicate];
          eventsArray = [eventsArray sortedArrayUsingSelector:@selector(compareStartDateWithEvent:)];
          if(eventsArray.count < 1) {
            self.eventDetails.text = @"No Upcoming Events.";
            return;
          }
          finalEventsArr = eventsArray;
        }
        NSString *eventType = @"• ";
        EKEvent *event = finalEventsArr[0];
        NSString *eventTitle = [NSString stringWithFormat:@"%@", event.title];
        if([eventTitle isEqualToString:@"(null)"]) {
          self.eventDetails.text = @"No Upcoming Events.";
          return;
        }
        self.eventDetails.text = [eventType stringByAppendingString:eventTitle];
        NSString *localeID;
        if([[NSLocale preferredLanguages] count] > (int)aprilPreferredLanguage) {
          localeID = [[NSLocale preferredLanguages] objectAtIndex:(int)aprilPreferredLanguage];
        } else {
          localeID = [[NSLocale currentLocale] localeIdentifier];
        }
        if(aprilEventDetailFormat.length < 1) {
          aprilEventDetailFormat = @"h:mm a";
        }

        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"h:mm a"];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:localeID]];
        [dateFormatter setCalendar:[NSCalendar calendarWithIdentifier:aprilDateLabelCalendar]];

        NSString *eventTimestamp = [dateFormatter stringFromDate:event.startDate];
        NSString *finalLabel = [self.eventDetails.text stringByAppendingString:[NSString stringWithFormat:@" %@", eventTimestamp]];;
        self.eventDetails.text = finalLabel;
      }
    }
  }

%new
  -(void)updateClockAndDateLabel {
    if(self.timeLabel) {
      NSString *localeID;
      if([[NSLocale preferredLanguages] count] > (int)aprilPreferredLanguage) {
        localeID = [[NSLocale preferredLanguages] objectAtIndex:(int)aprilPreferredLanguage];
      } else {
        localeID = [[NSLocale currentLocale] localeIdentifier];
      }

      if(aprilTimeLabelSwitch) {
        if(aprilTimeLabelFormat.length < 1) {
          aprilTimeLabelFormat = @"h:mm";
        }
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        [timeFormatter setDateFormat:aprilTimeLabelFormat];
        [timeFormatter setLocale:[NSLocale localeWithLocaleIdentifier:localeID]];
        [timeFormatter setCalendar:[NSCalendar calendarWithIdentifier:aprilDateLabelCalendar]];
        if(![aprilTimeZone isEqualToString:@""])
          timeFormatter.timeZone = [NSTimeZone timeZoneWithName:aprilTimeZone];
        self.timeLabel.text = [timeFormatter stringFromDate:self.date];

        if(aprilTimeLabelLowercase) {
          self.timeLabel.text = [self.timeLabel.text lowercaseString];
        }
      }

      if(aprilDateLabelSwitch) {
        if(aprilDateBatteryOnly) {
          self.dateLabel.text = [NSString stringWithFormat:@"%.f%% Charged", floor([[UIDevice currentDevice] batteryLevel] * 100)];
          return;
        }
        if(aprilDateLabelFormat.length < 1) {
          aprilDateLabelFormat = @"EEEE, MMMM d";
        }
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:aprilDateLabelFormat];
        [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:localeID]];
        [dateFormatter setCalendar:[NSCalendar calendarWithIdentifier:aprilDateLabelCalendar]];
        if(![aprilTimeZone isEqualToString:@""])
          dateFormatter.timeZone = [NSTimeZone timeZoneWithName:aprilTimeZone];
        self.dateLabel.text = [dateFormatter stringFromDate:self.date];

        if(aprilDateLabelLowercase) {
          self.dateLabel.text = [self.dateLabel.text lowercaseString];
        }
      }
    }
  }

%new
  -(void)updateWeatherLabel {
    if([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])
      return;
    NSString *localeID;
    if([[NSLocale preferredLanguages] count] > (int)aprilPreferredLanguage) {
      localeID = [[NSLocale preferredLanguages] objectAtIndex:(int)aprilPreferredLanguage];
    } else {
      localeID = [[NSLocale currentLocale] localeIdentifier];
    }
    if(aprilSolarTimeFormat.length < 1) {
      aprilSolarTimeFormat = @"H:mm";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:aprilSolarTimeFormat];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:localeID]];
    [dateFormatter setCalendar:[NSCalendar calendarWithIdentifier:aprilDateLabelCalendar]];
    if(![aprilTimeZone isEqualToString:@""])
      dateFormatter.timeZone = [NSTimeZone timeZoneWithName:aprilTimeZone];
    if(self.weatherLabel && aprilWeatherLabelSwitch) {
      self.weatherLabel.text = [aprilWeatherLabelFormat stringByReplacingOccurrencesOfString:@"DG" withString:[weatherPadView temperature]];
      self.weatherLabel.text = [aprilWeatherLabelFormat stringByReplacingOccurrencesOfString:@"CND" withString:[weatherPadView conditionsLine]];
      self.weatherLabel.text = [aprilWeatherLabelFormat stringByReplacingOccurrencesOfString:@"LLLL" withString:[weatherPadView locationName]];

      if(aprilWeatherLabelLowercase) {
        self.weatherLabel.text = [self.weatherLabel.text lowercaseString];
      }

      if(aprilWeatherUseConditionImages) {
        UIImage *ogi = [weatherPadView conditionsImage];
        self.weatherConditionImage.image = [UIImage imageWithCGImage:[ogi CGImage]
                                                    scale:(ogi.scale * 1.5)
                                                    orientation:(ogi.imageOrientation)];
        self.weatherConditionImage.tintColor = LCPParseColorString(aprilWeatherLabelColor, @"#FFFFFF");
        self.weatherConditionImage.hidden = NO;
      } else {
        if([self.weatherStackView.subviews containsObject:self.weatherConditionImage]) {
          [self.weatherStackView removeArrangedSubview:self.weatherConditionImage];
          self.weatherConditionImage.hidden = YES;
        }
      }
    }
  }

%new
  -(void)updateWeatherForCity {
    [self updateWeatherLabel];
  }

%new
  -(void)batteryStateChanged:(NSNotification *)notification {
    if(aprilChargingInformation && ![self.dateLabel.text containsString:@"Charged"]) {
      NSString *oldDateText = self.dateLabel.text;
      int batteryLevel = (int)([UIDevice currentDevice].batteryLevel * 100);
      if(([UIDevice currentDevice].batteryState == UIDeviceBatteryStateCharging || aprilBatteryWhenCharging) || [UIDevice currentDevice].batteryState == UIDeviceBatteryStateUnplugged) {
        [UIView transitionWithView:self.dateLabel duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
          self.dateLabel.text = [NSString stringWithFormat:@"%d%% Charged", batteryLevel];
        } completion:nil];
      }

      dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView transitionWithView:self.dateLabel duration:0.2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
          self.dateLabel.text = oldDateText;
        } completion:nil];
      });
    }
  }

%new
  -(void)setAlignment:(int)alignment {
    if(alignment == 0) {
        //Left
      self.aprilStackView.alignment = UIStackViewAlignmentLeading;
      self.eventStackView.alignment = UIStackViewAlignmentLeading;
      [self.aprilStackView.leftAnchor constraintEqualToAnchor:self.leftAnchor].active = YES;
      if(aprilWeatherUseConditionImages) {
        [self.weatherStackView insertArrangedSubview:self.fillerView atIndex:2];
      } else {
        [self.weatherStackView insertArrangedSubview:self.fillerView atIndex:1];
      }
    } if(alignment == 1) {
        //Center
      self.aprilStackView.alignment = UIStackViewAlignmentCenter;
      self.eventStackView.alignment = UIStackViewAlignmentCenter;
      [self.aprilStackView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor].active = YES;

      [self.weatherStackView removeArrangedSubview:self.fillerView];
      self.weatherStackView.distribution = UIStackViewDistributionEqualSpacing;
    } if(alignment == 2) {
        //Right
      self.aprilStackView.alignment = UIStackViewAlignmentTrailing;
      self.eventStackView.alignment = UIStackViewAlignmentTrailing;
      [self.aprilStackView.rightAnchor constraintEqualToAnchor:self.rightAnchor].active = YES;
      [self.weatherStackView insertArrangedSubview:self.fillerView atIndex:0];
    }

    switch ((int)aprilWeatherConditionImageAlignment) {
        //Left
      case 0:
      if([self.weatherStackView.arrangedSubviews firstObject].tag == 2007) {
        [self.weatherStackView insertArrangedSubview:self.weatherConditionImage atIndex:1];
      } else {
        [self.weatherStackView insertArrangedSubview:self.weatherConditionImage atIndex:0];
      }
      break;
        //Right
      case 1:
      if(aprilWeatherUseConditionImages) {
        [self.weatherStackView insertArrangedSubview:self.weatherConditionImage atIndex:2];
      } else {
        [self.weatherStackView insertArrangedSubview:self.weatherConditionImage atIndex:1];
      }
      break;
    }

    [self.timeLabel setTextAlignment:alignment];
    [self.dateLabel setTextAlignment:alignment];
    [self.weatherLabel setTextAlignment:alignment];

    if(aprilEventLabelSwitch) {
      [self.aprilStackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:aprilOffset+15].active = YES;
    } else {
      [self.aprilStackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:aprilOffset].active = YES;
    }

    [UIView animateWithDuration:0.5/*1.2*/ delay:0 /*usingSpringWithDamping:0.5 initialSpringVelocity:(int)aprilSpringAnimationVelocity*/ options:UIViewAnimationOptionCurveEaseInOut animations:^{
      [self.aprilStackView layoutIfNeeded];
      [self.weatherStackView layoutIfNeeded];
      [self.eventStackView layoutIfNeeded];
    } completion:nil];
  }

%new
  -(void)fadeOutAprilWithDuration:(float)duration withDelay:(float)delay {
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
      self.aprilStackView.alpha = 0;
    } completion:nil];
  }

%new
  -(void)fadeInAprilWithDuration:(float)duration withDelay:(float)delay {
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
      self.aprilStackView.alpha = 1;
    } completion:nil];
  }

%new
  -(void)fadeOutOthersWithDuration:(float)duration withDelay:(float)delay {
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
      self.eventStackView.alpha = 0;
      self.weatherStackView.alpha = 0;
    } completion:nil];
  }

%new
  -(void)fadeInOthersWithDuration:(float)duration withDelay:(float)delay {
    [UIView animateWithDuration:duration delay:delay options:UIViewAnimationOptionCurveEaseInOut animations:^{
      self.eventStackView.alpha = 1;
      self.weatherStackView.alpha = 1;
    } completion:nil];
  }

%new
  -(void)spacingWithOffset:(UIScrollView*)offset {
    int spacingOffset = (int)offset.contentOffset.y;
    [self.timeLabel removeConstraints:self.timeLabel.constraints];
    [self.eventStackView removeConstraints:self.eventStackView.constraints];
    [self.eventDetails removeConstraints:self.eventDetails.constraints];
    if(spacingOffset > 0) {
      self.aprilStackView.spacing = 0;
      self.eventStackView.spacing = 0;
      [self.timeLabel.topAnchor constraintEqualToAnchor:self.weatherStackView.bottomAnchor constant:-7.5].active = YES;
      [self.timeLabel.bottomAnchor constraintEqualToAnchor:self.dateLabel.topAnchor constant:7.5].active = YES;
      [self.eventStackView.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor constant:5].active = YES;
      [self.eventDetails.topAnchor constraintEqualToAnchor:self.eventTitle.bottomAnchor constant:5].active = YES;
      return;
    }
    self.aprilStackView.spacing = spacingOffset * 128;
    self.eventStackView.spacing = spacingOffset * 64;
    [self.timeLabel.topAnchor constraintEqualToAnchor:self.weatherStackView.bottomAnchor constant:-7.5 + spacingOffset * 128].active = YES;
    [self.timeLabel.bottomAnchor constraintEqualToAnchor:self.dateLabel.topAnchor constant:7.5 - spacingOffset * 128].active = YES;
    [self.eventStackView.topAnchor constraintEqualToAnchor:self.dateLabel.bottomAnchor constant:5 + spacingOffset * 128].active = YES;
    [self.eventDetails.topAnchor constraintEqualToAnchor:self.eventTitle.bottomAnchor constant:5 + spacingOffset * 128].active = YES;
  }

%new
  -(void)preferencesChanged {
    [self.timeLabel setFont:[UIFont systemFontOfSize:aprilTimeLabelSize weight:aprilTimeLabelWeight]];
    [self.dateLabel setFont:[UIFont systemFontOfSize:aprilDateLabelSize weight:aprilDateLabelWeight]];
    [self.weatherLabel setFont:[UIFont systemFontOfSize:aprilWeatherLabelSize weight:aprilWeatherLabelWeight]];
    [self.eventTitle setFont:[UIFont systemFontOfSize:aprilEventTitleSize weight:aprilEventTitleWeight]];
    [self.eventDetails setFont:[UIFont systemFontOfSize:aprilEventDetailSize weight:aprilEventDetailWeight]];

    [self.timeLabel setTextColor:LCPParseColorString(aprilTimeLabelColor, @"#FFFFFF")];
    [self.dateLabel setTextColor:LCPParseColorString(aprilDateLabelColor, @"#FFFFFF")];
    [self.weatherLabel setTextColor:LCPParseColorString(aprilWeatherLabelColor, @"#FFFFFF")];
    [self.eventTitle setTextColor:LCPParseColorString(aprilEventTitleColor, @"#FFFFFF")];
    [self.eventDetails setTextColor:LCPParseColorString(aprilEventDetailColor, @"#FFFFFF")];
    lockColor = LCPParseColorString(aprilFaceIDLockColor, @"#FFFFFF");

    [self setAlignment:(int)aprilAlignment];
    [self updateClockAndDateLabel];
    [self updateWeatherLabel];
    [self updateEventsLabel];
    [proudLockIconView didMoveToWindow];
    [proudLockIconView setContentColor:[UIColor systemGreenColor]];
    [proudLockIconView setAlpha:1.f];
    [proudLockIconView layoutIfNeeded];
  }

-(void)didMoveToSuperView {
  %orig;
  [self updateEventsLabel];
}

%end

%hook SBUIProudLockIconView
-(id)initWithFrame:(CGRect)arg1 {
  return proudLockIconView = %orig;
}

-(void)didMoveToWindow {
  %orig;
  if(aprilHideFaceIDLock)
    [self setHidden:YES];
  else
    [self setHidden:NO];
}

-(void)setFrame:(CGRect)frame {
  %orig(CGRectMake(aprilFaceIDXControl, aprilFaceIDYControl, 23 + aprilFaceIDSizeControl, 33 + aprilFaceIDSizeControl));
}

-(void)setAlpha:(double)alpha {
  %orig(aprilFaceIDAlphaControl);
}

-(void)setContentColor:(UIColor *)arg1 {
  %orig(lockColor);
}

%end

%hook SBIconController
-(void)viewDidAppear:(BOOL)animated {
  %orig;
  APRSetupController *setup = [[APRSetupController alloc] init];
  setup.modalPresentationStyle = UIModalPresentationPageSheet;
  // [self presentViewController:setup animated:YES completion:nil];
}
%end

%end

%ctor {
  loadPrefs();
  %init(All);
  if(@available(iOS 13, *)) {
    %init(iOS13);
  } else {
    %init(iOS12);
  }
  if(aprilAlwaysUseWallpaper)
    aprilUseWallpaperColors();
}
