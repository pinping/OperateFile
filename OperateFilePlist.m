//
//  OperateFilePlist.m
//  MacCamera
//
//  Created by ZhaoPinYang on 12-12-4.
//  Copyright (c) 2012年 maclove. All rights reserved.
//

#import "OperateFilePlist.h"

@implementation OperateFilePlist


/**
 *	@brief	把传入的数组数据通过本方法去掉重复的数据
 *
 *  @param	RepeatArr传入一个数组参数
 *
 *	@return	返回一个去重的数组
 */
+ (NSArray *) MacLoveRepeat:(NSArray *) RepeatArr
{
		
	NSMutableArray	*categoryArray = [[NSMutableArray alloc] init];
	
	for (unsigned i = 0; i < [RepeatArr count]; i++){
			
			if ([categoryArray containsObject:[RepeatArr objectAtIndex:i]] == NO){
					
					[categoryArray addObject:[RepeatArr objectAtIndex:i]];
					
			}
	}

	return [categoryArray autorelease];
}


/**
 *	@brief	通过传入的字符串路径，查找该路径的所以文件，把所有文件的名称返回；
 *
 *  @param	FilePath传入一个字符串路径。
 *
 *	@return	返回所有文件的名称。
 */
+ (NSArray *) queryFilePath: (NSString *) FilePath {
	
		NSArray *subpaths;
		NSString *fontPath = [self dataFilePath:FilePath FileName:nil FileType:nil];

		NSFileManager *fileManager = [[NSFileManager alloc] init];
		subpaths = [fileManager subpathsAtPath:fontPath];

		return subpaths;
}


/**
 *	@brief	以时间为基础生成一个当前时间的字符串,例如：20130201；
 *
 *	@return	返回当前时间的字符串。
 */
+ (NSString *)generateTradeNOPlist{
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:kCFDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSString *resultes = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    [formatter release];
    return resultes;
}


/**
 *	@brief	以时间为基础生成一个当前时间的字符串+5个随机的字符串,例如：ABCDE201302011034；
 *
 *	@return	返回当前时间的字符串+5个随机的字符串。
 */
+ (NSString *)generateTradeNO{
    const int N = 5;
    
    NSString *sourceString = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *result = [[[NSMutableString alloc] init] autorelease];
    srand(time(0));
    for (int i = 0; i < N; i++)
        {
            unsigned index = rand() % [sourceString length];
            NSString *s = [sourceString substringWithRange:NSMakeRange(index, 1)];
            [result appendString:s];
        }
    NSDate * date = [NSDate date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:kCFDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyyMMddHHmm"];
    NSString *resultes = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    [formatter release];
    [result stringByAppendingFormat:@"%@",resultes];
    NSLog(@"resultes%@",[result stringByAppendingFormat:@"%@",resultes]);
    return [result stringByAppendingFormat:@"%@",resultes];
}


/**
 *	@brief	保存一个指定名称的图片
 *
 *  @param	FilePath  指定图片路径
 *
 *  @param	FileName  指定图片名称
 *
 *  @param	FileType  指定图片类型
 *
 *  @param	FileImagey  指定图片
 */
+ (void) saveToFile: (NSString *) FilePath
					FilePlist: (NSString *) FilePlist
			FilePlistType: (NSString *) FilePlistType
					 FileName: (NSString *) FileName
					 FileType: (NSString *) FileType
				 FileImagey: (UIImage	*) FileImagey{
	
    [UIImageJPEGRepresentation(FileImagey, 1.0f) writeToFile:[self dataFilePath:FilePath FileName:FileName FileType:FileType] atomically:YES];
	
    NSArray	*ssss=[[NSArray alloc] initWithObjects:FileName, nil];
	
	
    [self SaveToFilePlist:FilePlist FileName:[self generateTradeNOPlist] FileType:FilePlistType FileArray:ssss fileNO:YES];
	[ssss release];
    ssss = nil;
}


/**
 *	@brief	根据传入的文件名，保存传入数据。
 *
 *  @param	FilePath  指定数据路径
 *
 *  @param	FileName  指定数据名称
 *
 *  @param	FileType  指定数据类型
 *
 *	@param	FileArray  传入数据
 *
 *	@return	没有返回值
 */
+ (void) SaveToFilePlist: (NSString *) FilePath
								FileName: (NSString *) FileName
								FileType: (NSString *) FileType
							 FileArray: (NSArray	*) FileArray
									fileNO: (BOOL) fileNO
{
	
	BOOL bo;
	bo = [FileName isEqual:@""];
	NSAssert(!bo,@"保存文件等于空");
	bo = [FileArray count];
	NSAssert(bo,@"保存数组等于空");
	
	if ([[NSFileManager defaultManager] fileExistsAtPath:[self dataFilePath:FilePath FileName:FileName FileType:FileType]] && fileNO) {
       	NSMutableArray	*zongPlist =[[NSMutableArray alloc]initWithArray:[self	loadFromFile:FilePath FileName:FileName FileType:FileType]];
        [zongPlist addObjectsFromArray:FileArray];
        [[self MacLoveRepeat:zongPlist] writeToFile:[self dataFilePath:FilePath FileName:FileName FileType:FileType] atomically:YES];
        [zongPlist release];
        zongPlist	=	nil;
    }else {
        [[self MacLoveRepeat:FileArray] writeToFile:[self dataFilePath:FilePath FileName:FileName FileType:FileType] atomically:YES];
    }
	
	
	
}


/**
 *	@brief	通过《dataFilePath》方法查找到指定的文件，读取文件的数据，返回数据。
 *
 *  @param	FilePath  指定图片路径
 *
 *  @param	FileName  指定图片名称
 *
 *  @param	FileType  指定图片类型
 *
 *	@return	返回一个NSArray的数据。
 */
+ (NSArray *)loadFromFile:(NSString *) FilePath
								 FileName:(NSString *) FileName
								 FileType:(NSString *) FileType{
    NSString *filePath=[self dataFilePath:FilePath FileName:FileName FileType:FileType];
		NSArray *arrays = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        arrays=[[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    }
    return arrays;
}


/**
 *	@brief	查找指定名称的jpg文件，如果文件存在返回文件的路径，反之返回一个路径。
 *
 *  @param	FilePath  指定图片路径
 *
 *  @param	FileName  指定图片名称
 *
 *  @param	FileType  指定图片类型
 *
 *	@return	返回查找到的路径
 */
+ (NSString *) dataFilePath:(NSString *) FilePath
									 FileName:(NSString *) FileName
									 FileType:(NSString *) FileType{
		NSString *path;
		NSString *type;
		BOOL bo;
		
		if (FilePath) {
				path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:FilePath];
		}else{
				path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"Default"];
		}
		
		if (FileType) {
				type = [FileName stringByAppendingString:FileType];
		}
		
    if (FileName) {
				bo= [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        return [path stringByAppendingPathComponent:type];
    }else {
        bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        return path;
    }
		NSAssert(bo,@"创建目录失败");
		
}


@end
