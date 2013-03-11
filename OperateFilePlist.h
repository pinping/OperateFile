//
//  OperateFilePlist.h
//  MacCamera
//
//  Created by ZhaoPinYang on 12-12-4.
//  Copyright (c) 2012年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OperateFilePlist : NSObject{
		
}

+ (NSArray *) MacLoveRepeat:(NSArray *)RepeatArr;


+ (NSString *)generateTradeNOPlist;


+ (NSString *)generateTradeNO;


+ (void)saveToFile:(NSString *) FilePath
		  FileName:(NSString *) FileName
		  FileType:(NSString *) FileType
		FileImagey:(UIImage	*)FileImagey;


+ (void) SaveToFilePlist: (NSString *) FilePath
				FileName: (NSString *) FileName
				FileType: (NSString *) FileType
			   FileArray: (NSArray	*) FileArray;


+ (NSArray *)loadFromFile:(NSString *) FilePath
				 FileName:(NSString *) FileName
				 FileType:(NSString *) FileType;


+ (NSString *) dataFilePath:(NSString *) FilePath
				   FileName:(NSString *) FileName
				   FileType:(NSString *) FileType;

@end
