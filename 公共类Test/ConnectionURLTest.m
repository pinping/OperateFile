//
//  ConnectionURLTest.m
//  PPPublicClass
//
//  Created by pinping on 14-8-14.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ConnectionURL.h"

@interface ConnectionURLTest : XCTestCase

@end

@implementation ConnectionURLTest

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

- (void)testgenerateUuidString
{
    XCTAssertNotNil([ConnectionURL generateUuidString], @"密码验证失败");
}

@end
