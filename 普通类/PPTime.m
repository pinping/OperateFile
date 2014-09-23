//
//  PPTime.m
//  MacCamera
//
//  Created by pinping on 13-3-11.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPTime.h"

@implementation PPTime


//[self PPTimeNow]
+(NSDateComponents *)PPTimeNow
{
    NSDate              *now = [NSDate date];
    NSCalendar          *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents    *comps = [[NSDateComponents alloc] init];
    NSInteger           unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:now];
    return comps;
}

//[self PPTimeNow:atime Format:@"yyyy-MM-dd"]
+(NSDateComponents *)PPTimeNow:(NSString *)now Format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone      *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    NSString *stringTime = timeStr;
    NSDate *dateTime = [formatter dateFromString:now];
    
    NSCalendar          *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents    *comps = [[NSDateComponents alloc] init];
    NSInteger           unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:dateTime];
    return comps;
}

#pragma mark - PPTimeHour
+ (NSString *)PPTimeHour
{
    NSString *weekDay;
    weekDay = [NSString stringWithFormat:@"%ld", (long)[[self PPTimeNow] hour]];
    return weekDay;
}

#pragma mark - PPTimeMonth
+ (NSString *)PPTimeMonth
{
    NSString            *monthDay;
    switch ([[self PPTimeNow] month]) {
        case 1:
            monthDay = @"一月";
            break;
            
        case 2:
            monthDay = @"二月";
            break;
            
        case 3:
            monthDay = @"三月";
            break;
            
        case 4:
            monthDay = @"四月";
            break;
            
        case 5:
            monthDay = @"五月";
            break;
            
        case 6:
            monthDay = @"六月";
            break;
            
        case 7:
            monthDay = @"七月";
            break;
            
        case 8:
            monthDay = @"八月";
            break;
            
        case 9:
            monthDay = @"九月";
            break;
            
        case 10:
            monthDay = @"十月";
            break;
            
        case 11:
            monthDay = @"十一月";
            break;
            
        case 12:
            monthDay = @"十二月";
            break;
            
        default:
            monthDay = @"空";
            break;
    }
    return monthDay;
}

+ (NSString *)PPTimeMonth:(NSString *)atime
{
    NSString            *monthDay;
    switch ([[self PPTimeNow:atime Format:@"yyyy-MM-dd"] month]) {
        case 1:
            monthDay = @"一月";
            break;

        case 2:
            monthDay = @"二月";
            break;

        case 3:
            monthDay = @"三月";
            break;

        case 4:
            monthDay = @"四月";
            break;

        case 5:
            monthDay = @"五月";
            break;

        case 6:
            monthDay = @"六月";
            break;

        case 7:
            monthDay = @"七月";
            break;

        case 8:
            monthDay = @"八月";
            break;

        case 9:
            monthDay = @"九月";
            break;

        case 10:
            monthDay = @"十月";
            break;

        case 11:
            monthDay = @"十一月";
            break;

        case 12:
            monthDay = @"十二月";
            break;

        default:
            monthDay = @"空";
            break;
    }
    return monthDay;
}

#pragma mark - PPTimeWeek
+ (NSString *)PPTimeWeek
{
    NSString *weekDay;
    switch ([[self PPTimeNow] weekday]) {
        case 1:
            weekDay = @"星期日";
            break;
            
        case 2:
            weekDay = @"星期一";
            break;
            
        case 3:
            weekDay = @"星期二";
            break;
            
        case 4:
            weekDay = @"星期三";
            break;
            
        case 5:
            weekDay = @"星期四";
            break;
            
        case 6:
            weekDay = @"星期五";
            break;
            
        case 7:
            weekDay = @"星期六";
            break;
            
        default:
            break;
    }
    return weekDay;
    
}

+ (NSString *)PPTimeWeek:(NSString *)atime
{
    
    NSString *weekDay;
    switch ([[self PPTimeNow:atime Format:@"yyyy-MM-dd"] weekday]) {
        case 1:
            weekDay = @"星期日";
            break;

        case 2:
            weekDay = @"星期一";
            break;

        case 3:
            weekDay = @"星期二";
            break;

        case 4:
            weekDay = @"星期三";
            break;

        case 5:
            weekDay = @"星期四";
            break;

        case 6:
            weekDay = @"星期五";
            break;

        case 7:
            weekDay = @"星期六";
            break;

        default:
            break;
    }
    return weekDay;
}

#pragma mark - PPTimeDay
+ (NSString *)PPTimeDay
{
    int         week = (int)[[self PPTimeNow] day];
    NSString    *weekDay;
    weekDay = [NSString stringWithFormat:@"%d", week];
    return weekDay;
}

+ (NSString *)PPTimeDay:(NSString *)atime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone      *timeZone = [NSTimeZone localTimeZone];

    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *dateTime = [formatter dateFromString:atime];

    NSCalendar          *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents    *comps = [[NSDateComponents alloc] init];
    NSInteger           unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
        NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:dateTime];
    int         week = (int)[comps day];
    NSString    *weekDay;
    weekDay = [NSString stringWithFormat:@"%d", week];
    return weekDay;
}

#pragma mark - PPTimeMonthWeek
+ (NSString *)PPTimeMonthWeek
{
    NSDate              *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone      *timeZone = [NSTimeZone localTimeZone];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString    *stringTime = [[formatter stringFromDate:now] stringByAppendingString:@"01"];
    NSDate      *dateTime = [formatter dateFromString:stringTime];
    
    NSCalendar          *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents    *comps = [[NSDateComponents alloc] init];
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:dateTime];
    
    NSLog(@"dateTime%@", dateTime);
    NSString *weekDay;
    switch ([comps weekday]) {
        case 1:
            weekDay = @"星期日";
            break;
            
        case 2:
            weekDay = @"星期一";
            break;
            
        case 3:
            weekDay = @"星期二";
            break;
            
        case 4:
            weekDay = @"星期三";
            break;
            
        case 5:
            weekDay = @"星期四";
            break;
            
        case 6:
            weekDay = @"星期五";
            break;
            
        case 7:
            weekDay = @"星期六";
            break;
            
        default:
            break;
    }
    return weekDay;
}

+ (NSString *)PPTimeMonthWeek:(NSString *)atime
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone      *timeZone = [NSTimeZone localTimeZone];

    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString    *stringTime = [atime stringByAppendingString:@"01"];
    NSDate      *dateTime = [formatter dateFromString:stringTime];

    NSCalendar          *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents    *comps = [[NSDateComponents alloc] init];
    comps = [calendar components:NSWeekdayCalendarUnit fromDate:dateTime];

    NSLog(@"dateTime%@", dateTime);

    NSString *weekDay;
    switch ([comps weekday]) {
        case 1:
            weekDay = @"星期日";
            break;
            
        case 2:
            weekDay = @"星期一";
            break;
            
        case 3:
            weekDay = @"星期二";
            break;
            
        case 4:
            weekDay = @"星期三";
            break;
            
        case 5:
            weekDay = @"星期四";
            break;
            
        case 6:
            weekDay = @"星期五";
            break;
            
        case 7:
            weekDay = @"星期六";
            break;
            
        default:
            break;
    }
    return weekDay;
    
    
}

#pragma mark - PPIntervalToNow





+ (NSString *)PPIntervalToNow:(NSDate *) theDate
{
    NSTimeInterval late = [theDate timeIntervalSinceNow];
    NSDate* dat = [NSDate date];
    NSTimeInterval now = [dat timeIntervalSinceNow];
    NSString *timeString = @"";
    
    NSTimeInterval cha = late - now;
    
    if (cha / 86399 > 1) { //计算天,小时,分
        timeString = [NSString stringWithFormat:@"%f", cha / 86399];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString=[NSString stringWithFormat:@"%@天", timeString];
        
        int  aTime= (long int )cha % 86399;
        int  bTime= (long int )aTime % 3599;
        
        if (aTime  > 3599) {
            timeString=[timeString stringByAppendingFormat:@"%d小时", aTime / 3599];
            
            if (bTime < 3599) {
                timeString=[timeString stringByAppendingFormat:@"%d分钟", bTime / 60];
            }
        }
    }else if (cha > 3599 && cha < 86400){//计算小时,分
        
        timeString = [NSString stringWithFormat:@"%f", cha / 3599];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString = [NSString stringWithFormat:@"%@小时", timeString];
        
        int  aTime= (long int )cha % 3599;
        if (aTime < 3599) {
            timeString=[timeString stringByAppendingFormat:@"%d分钟", aTime / 60];
        }
    }else if (cha > 60) {//计算,分
        
        timeString = [NSString stringWithFormat:@"%f", cha / 60];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString=[NSString stringWithFormat:@"%@分钟", timeString];
        int  aTime= (long int )cha % 59;
        if (aTime < 59) {
            timeString=[timeString stringByAppendingFormat:@"%d秒", aTime];
        }
        
    }else if(cha < 60){
        timeString = [NSString stringWithFormat:@"%f", cha];
        timeString = [timeString substringToIndex:timeString.length - 7];
        timeString=[NSString stringWithFormat:@"%@秒", timeString];
    }
    
    return timeString;
}



#pragma mark - 未知方法 -

+ (NSString*)convertDateFormatter:(NSString*)sourceFormatter
									targetFormatter:(NSString*)targetFormatter
											 dateString:(NSString*)dateString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:sourceFormatter];
    NSDate *date = [dateFormatter dateFromString:dateString];
    [dateFormatter setDateFormat:targetFormatter];
		
    return[dateFormatter stringFromDate:date];
}


+(NSString *)getNowTime
{
    NSString* date;
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    date = [formatter stringFromDate:[NSDate date]];
    return date;
}


+(NSString *)gettimeCha:(NSString *)time
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:[time substringWithRange:NSMakeRange(8, 2)].intValue];
    [comps setMonth:[time substringWithRange:NSMakeRange(5, 2)].intValue];
    [comps setYear:[time substringToIndex:4].intValue];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *endDate = [[NSDate alloc] init];
    NSDate *startDate = [gregorian dateFromComponents:comps];
		
    unsigned int unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *comps2 = [gregorian components:unitFlags fromDate:startDate toDate:endDate options:0];
    int days = (int)[comps2 day];
    int months = (int)[comps2 month] * 30;
    int years = (int)[comps2 year] * 365;
		
    int dayCount = years +months + days;
    
    if(dayCount == 0)
				{
        NSString *nowHour = [self getNowTime];
        
        NSString *nowMin = [nowHour substringWithRange:NSMakeRange(14, 2)];
        
        nowHour = [nowHour substringWithRange:NSMakeRange(11, 2)];
        
        if(nowHour.intValue == [time substringWithRange:NSMakeRange(11, 2)].intValue)
						{
            if(nowMin.intValue - [time substringWithRange:NSMakeRange(14, 2)].intValue == 0)
								{
                return @"1分钟前";
								}
            return [NSString stringWithFormat:@"%d分钟前",(unsigned)(nowMin.intValue -  [time substringWithRange:NSMakeRange(14, 2)].intValue )];
						}
        else
						{
            if(nowHour.intValue - [time substringWithRange:NSMakeRange(11, 2)].intValue == 1)
								{
                if(nowMin.intValue < [time substringWithRange:NSMakeRange(14, 2)].intValue)
										{
                    NSLog(@"time = %@",[time substringWithRange:NSMakeRange(14, 2)]);
										return [NSString stringWithFormat:@"%d分钟前",(unsigned)(nowMin.intValue + 60 - [time substringWithRange:NSMakeRange(14, 2)].intValue)];
										
										
										}
								}
            return [NSString stringWithFormat:@"%d小时前",(nowHour.intValue + 24 - [time substringWithRange:NSMakeRange(11, 2)].intValue)];
						}
				}
    else
				{
        return [NSString stringWithFormat:@"%d天前",(unsigned)dayCount];
				}
}


+ (NSString *)PPSetTimeInt:(NSTimeInterval)timeSeconds setTimeFormat:(NSString *)timeFormatStr setTimeZome:(NSString *)timeZoneStr
{
    
    NSString *date_string;
    
    NSDate *time_str;
    if( timeSeconds>0){
        time_str =[NSDate dateWithTimeIntervalSince1970:timeSeconds];
    }else{
        time_str=[[NSDate alloc] init];
    }
    
    if( timeFormatStr==nil){
        date_string =[NSString stringWithFormat:@"%ld",(long)[time_str timeIntervalSince1970]];
    }else{
        NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
        [formatter setDateFormat:timeFormatStr];
        if( timeZoneStr!=nil){
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:timeZoneStr]];
        }
        date_string =[formatter stringFromDate:time_str];
    }
    return date_string;
}



@end