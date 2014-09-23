//
//  LoginControllerTest.m
//  PPPublicClass
//
//  Created by pinping on 14-8-6.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginController.h"

@interface LoginControllerTest : XCTestCase

@end

@implementation LoginControllerTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark - testPassWord
- (void)testPassWord1
{
    XCTAssertTrue([LoginController isValidatePassWord:@"123456"], @"密码验证失败");
}

- (void)testPassWord2
{
    XCTAssertTrue([LoginController isValidatePassWord:@"dbdsbdbfdsb"], @"密码验证失败");
}

- (void)testPassWord3
{
    XCTAssertTrue([LoginController isValidatePassWord:@"123457890"], @"密码验证失败");
}

#pragma mark - testPhone
- (void)testPhone1
{
    XCTAssertTrue([LoginController isValidatePhone:@"12345600000"], @"手机号验证失败");
}

- (void)testPhone2
{
    XCTAssertTrue([LoginController isValidatePhone:@"18988726664"], @"手机号密码验证失败");
}

- (void)testPhone3
{
    XCTAssertTrue([LoginController isValidatePhone:@"17788726664"], @"手机号密码验证失败");
}

#pragma mark - testEmail
- (void)testEmail1
{
    XCTAssertTrue([LoginController isValidateEmail:@"3777954@qq.com"], @"邮箱验证失败");
}

- (void)testEmail2
{
    XCTAssertTrue([LoginController isValidateEmail:@"3777954@163.cn"], @"邮箱验证失败");
}

- (void)testEmail3
{
    XCTAssertTrue([LoginController isValidateEmail:@"3777954@163.com"], @"邮箱验证失败");
}

#pragma mark - testCode
- (void)testCode1
{
    XCTAssertTrue([LoginController isValidateCode:@"123425"], @"验证码验证失败");
}

- (void)testCode2
{
    XCTAssertTrue([LoginController isValidateCode:@"123456"], @"验证码验证失败");
}

- (void)testCode3
{
    XCTAssertTrue([LoginController isValidateCode:@"123864"], @"验证码验证失败");
}



@end