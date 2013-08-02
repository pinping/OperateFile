//
//  NSString+PPString.m
//  定制
//
//  Created by pinping on 13-7-4.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "NSString+PPString.h"

@implementation NSString (PPString)

+ (NSString *)removeImgNamePath:(NSString *)aStr
{
		NSArray *array11 = [aStr componentsSeparatedByString:@"/"];
		NSString  *tempStr= [array11 objectAtIndex:[array11 count]-1];
		
		return tempStr;
}

@end
