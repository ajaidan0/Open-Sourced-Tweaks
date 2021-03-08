/**
 * Aeolus : Tweak.m
 *
 * Copyright (c) Monotrix 2020- (https://github.com/Monotrix)
**/

#import <Orion/Orion.h>

__attribute__((constructor)) static void init() {
    NSLog(@"[AE] INJECTING TWEAK AT %f", [[NSDate date] timeIntervalSince1970]);
    orion_init();
}
