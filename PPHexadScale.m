//
//  PPHexadScale.m
//  PPPublicClass
//
//  Created by pinping on 14-5-20.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import "PPHexadScale.h"

@implementation PPHexadScale

+ (int)PPHexToDec:(NSString *)aDec
{
    int tmepInt00 = 0;
    int arrLen = (int)[aDec length];
    
    for (int i = 0; i < arrLen; i++) {
        int         tempInt = 0;
        NSString    *string2 = [aDec substringWithRange:NSMakeRange(i * 1, 1)];
        
        if ([string2 isEqualToString:@"A"] || [string2 isEqualToString:@"a"]) {
            tempInt = 10;
        }
        
        if ([string2 isEqualToString:@"B"] || [string2 isEqualToString:@"b"]) {
            tempInt = 11;
        }
        
        if ([string2 isEqualToString:@"C"] || [string2 isEqualToString:@"c"]) {
            tempInt = 12;
        }
        
        if ([string2 isEqualToString:@"D"] || [string2 isEqualToString:@"d"]) {
            tempInt = 13;
        }
        
        if ([string2 isEqualToString:@"E"] || [string2 isEqualToString:@"e"]) {
            tempInt = 14;
        }
        
        if ([string2 isEqualToString:@"F"] || [string2 isEqualToString:@"f"]) {
            tempInt = 15;
        }
        
        if (tempInt == 0) {
            tempInt = [string2 intValue];
        }
        
        double val = pow(16, arrLen - i - 1);
        tmepInt00 = tmepInt00 + val * tempInt;
    }
    
    return tmepInt00;
}

+ (NSString *)PPDecToHex:(int)aHex
{
    NSString        *nLetterValue;
    NSString        *str = @"";
    long long int   ttmpig;

    for (int i = 0; i < 9; i++) {
        ttmpig = aHex % 16;
        aHex = aHex / 16;
        switch (ttmpig) {
            case 10:
                nLetterValue = @"A"; break;

            case 11:
                nLetterValue = @"B"; break;

            case 12:
                nLetterValue = @"C"; break;

            case 13:
                nLetterValue = @"D"; break;

            case 14:
                nLetterValue = @"E"; break;

            case 15:
                nLetterValue = @"F"; break;

            default:
                nLetterValue = [[NSString alloc]initWithFormat:@"%lli", ttmpig];
        }
        str = [nLetterValue stringByAppendingString:str];

        if (aHex == 0) {
            break;
        }
    }

    return str;
}

@end
