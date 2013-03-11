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
+ (NSArray *) MacLoveRepeat:(NSArray *)RepeatArr
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
+ (void)saveToFile:(NSString *) FilePath
		  FileName:(NSString *) FileName
		  FileType:(NSString *) FileType
		FileImagey:(UIImage	*)FileImagey{
	
    [UIImageJPEGRepresentation(FileImagey, 1.0f) writeToFile:[self dataFilePath:FileName FileName:FileName FileType:FileType] atomically:YES];
    NSArray	*ssss=[[NSArray alloc] initWithObjects:FileName, nil];
    [self SaveToFilePlist:[self generateTradeNOPlist] FileArray:ssss];
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
 *	@param	FileArray传入数据
 *
 *	@return	没有返回值
 */
+ (void) SaveToFilePlist: (NSString *) FilePath
				FileName: (NSString *) FileName
				FileType: (NSString *) FileType
			   FileArray: (NSArray	*) FileArray
{
	
	BOOL bo = [FileName isEqual:@""];
	NSAssert(!bo,@"保存文件等于空");
	BOOL bo1 = [FileArray count];
	NSAssert(bo1,@"保存数组等于空");
    [FileArray writeToFile:[self dataFilePath:FilePath FileName:FileName FileType:FileType] atomically:YES];
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
    NSString *filePath=[self dataFilePath:FileName FileName:FileName FileType:FileType];
    NSArray *arrays;
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
	
	if (!FilePath) {
		path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:FilePath];
	}else{
		path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:@"default"];
	}
	
	if (FileType) {
		type = [FileName stringByAppendingString:FileType];
	}else{
		NSAssert(FileType,@"创建目录失败");
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
