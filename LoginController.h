//
//  LoginController.h
//  PPPublicClass
//
//  Created by pinping on 14-7-22.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicClassProtocol.h"


@interface LoginController : NSObject


/**
 *  通过传入的数据和规则验证数据是否通过.
 *
 *  @param strDestination 目标数据
 *  @param strExpression  验证规则
 *
 *  @return true 表示验证成功;
 *			false 表示验证失败;
 */
+ (BOOL)isValidateRegularExpression:(NSString *)strDestination byExpression:(NSString *)strExpression;


/**
 *  通过传入的密码进行验证密码是否正确
 *
 *  @param pass 密码
 *
 *  @return true 表示验证成功;
 *  	 	false 表示验证失败;
 */
+ (BOOL)isValidatePassWord:(NSString *)pass;

/**
 *  通过传入的手机号进行验证手机号是否正确
 *
 *  @param phone 手机号
 *
 *  @return true 表示验证成功;
 *  	 	false 表示验证失败;
 */
+ (BOOL)isValidatePhone:(NSString *)phone;


/**
 *  通过传入的邮箱进行验证邮箱是否正确
 *
 *	@param email 邮箱.
 *
 *  @return true 表示验证成功;
 *			false 表示验证失败;
 */
+ (BOOL)isValidateEmail:(NSString *)email;


/**
 *  通过传入的验证码进行验证验证码是否正确(只能输入数字,只能输入6位)
 *
 *	@param code 验证码.
 *
 *  @return true 表示验证成功;
 *			false 表示验证失败;
 */
+ (BOOL)isValidateCode:(NSString *)code;

@end
