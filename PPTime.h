//
//  PPTime.h
//  MacCamera
//
//  Created by pinping on 13-3-11.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPTime : NSObject


+ (NSString *)PPTimeHour;

+ (NSString *)PPTimeMonth:(NSString *)atime;

+ (NSString *)PPTimeWeek:(NSString *)atime;

+ (NSString *)PPTimeDay:(NSString *)atime;

+ (NSString *)PPSetTimeInt:(NSTimeInterval)timeSeconds setTimeFormat:(NSString *)timeFormatStr setTimeZome:(NSString *)timeZoneStr;

@end