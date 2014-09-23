//
//  PPTiemTest.m
//  Fortune
//
//  Created by iMac on 14-9-4.
//  Copyright (c) 2014年 深圳市中科创财富通网络金融有限公司(赵品评). All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PPTime.h"


@interface PPTiemTest : XCTestCase

@end

@implementation PPTiemTest

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


#pragma mark - PPTimeHour
- (void)testTimeHour1
{
//    XCTAssertEqualObjects([PPTime PPTimeHour], @"5", @"时间验证失败");
}

- (void)testTimeHour2
{
//    XCTAssertEqualObjects([PPTime PPTimeHour], @"8", @"时间验证失败");
}


#pragma mark - PPTimeMonth
- (void)testTimeMonth1
{
    XCTAssertEqualObjects([PPTime PPTimeMonth:@"2014-09-14"], @"九月", @"月份验证失败");
}

- (void)testTimeMonth2
{
//    XCTAssertEqualObjects([PPTime PPTimeMonth:@"2014-08-14"], @"九月", @"月份验证失败");
}

- (void)testTimeMonth3
{
    XCTAssertEqualObjects([PPTime PPTimeMonth], @"九月", @"月份验证失败");
}

- (void)testTimeMonth4
{
//    XCTAssertEqualObjects([PPTime PPTimeMonth], @"十月", @"月份验证失败");
}


#pragma mark - PPTimeWeek
- (void)testTimeWeek1
{
    XCTAssertEqualObjects([PPTime PPTimeWeek:@"2014-09-04"], @"星期四", @"星期验证失败");
}

- (void)testTimeWeek2
{
//    XCTAssertEqualObjects([PPTime PPTimeWeek:@"2014-08-03"], @"星期四", @"星期验证失败");
}

- (void)testTimeWeek3
{
//    XCTAssertEqualObjects([PPTime PPTimeWeek], @"星期四", @"星期验证失败");
}

- (void)testTimeWeek4
{
//    XCTAssertEqualObjects([PPTime PPTimeWeek], @"星期三", @"星期验证失败");
}


#pragma mark - PPTimeWeek
- (void)testTimeDay1
{
    XCTAssertEqualObjects([PPTime PPTimeDay:@"2014-09-04"], @"4", @"月份验证失败");
}

- (void)testTimeDay2
{
    XCTAssertEqualObjects([PPTime PPTimeDay:@"2014-08-03"], @"3", @"月份验证失败");
}

- (void)testTimeDay3
{
    XCTAssertEqualObjects([PPTime PPTimeDay], @"5", @"月份验证失败");
}

- (void)testTimeDay4
{
    XCTAssertEqualObjects([PPTime PPTimeDay], @"5", @"月份验证失败");
}


#pragma mark - PPTimeMonthWeek
- (void)testTimeMonthWeek1
{
    XCTAssertEqualObjects([PPTime PPTimeMonthWeek:@"201409"], @"星期一", @"星期验证失败");
}

- (void)testTimeMonthWeek2
{
    XCTAssertEqualObjects([PPTime PPTimeMonthWeek:@"201408"], @"星期五", @"星期验证失败");
}

- (void)testTimeMonthWeek3
{
    XCTAssertEqualObjects([PPTime PPTimeMonthWeek], @"星期一", @"星期验证失败");
}

- (void)testTimeMonthWeek4
{
//    XCTAssertEqualObjects([PPTime PPTimeMonthWeek], @"星期二", @"星期验证失败");
}

- (void)testIntervalToNow1
{
    NSDate *yesterday = [NSDate dateWithTimeIntervalSinceNow: (66)];
    
    NSLog(@"[PPTime PPIntervalToNow:yesterday] %@",[PPTime PPIntervalToNow:yesterday]);
    
//    XCTAssertEqualObjects([PPTime PPIntervalToNow:yesterday], @"星期一", @"星期验证失败");
}




@end
