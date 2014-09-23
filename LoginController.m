//
//  LoginController.m
//  PPPublicClass
//
//  Created by pinping on 14-7-22.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import "LoginController.h"

@implementation LoginController

+ (BOOL)isValidateRegularExpression:(NSString *)strDestination byExpression:(NSString *)strExpression
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strExpression];

    return [predicate evaluateWithObject:strDestination];
}

+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *strRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+.[A-Za-z]{1,5}";

    BOOL rt = [self isValidateRegularExpression:email byExpression:strRegex];

    return rt;
}

+ (BOOL)isValidatePhone:(NSString *)phone
{
    NSString *strRegex = @"^((1[0-9])|(1[^4,\\D])|(1[0,0-9]))\\d{9}$";

    BOOL rt = [self isValidateRegularExpression:phone byExpression:strRegex];

    return rt;
}

+ (BOOL)isValidatePassWord:(NSString *)pass
{
    NSString *strRegex = @"^[a-zA-Z0-9]{6,20}+$";

    BOOL rt = [self isValidateRegularExpression:pass byExpression:strRegex];

    return rt;
}

+ (BOOL)isValidateCode:(NSString *)code
{
    NSString *strRegex = @"^[0-9]{6}+$";
    
    BOOL rt = [self isValidateRegularExpression:code byExpression:strRegex];
    
    return rt;
}



@end