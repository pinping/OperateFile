//
//  OperateFilePlist.h
//  MacCamera
//
//  Created by ZhaoPinYang on 12-12-4.
//  Copyright (c) 2012年 maclove. All rights reserved.
//
@class OperateFilePlist;

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface OperateFilePlist : NSObject{
		
}

+ (NSArray *) MacLoveRepeat:(NSArray *)RepeatArr;

+ (NSArray *)queryFilePath: (NSString *)FilePath;

+ (NSString *)generateTradeNOPlist;

+ (NSString *)generateTradeNO;


+ (void)saveToFile:(NSString *) FilePath
		 FilePlist:(NSString *) FilePlist
	 FilePlistType:(NSString *) FilePlistType
		  FileName:(NSString *) FileName
		  FileType:(NSString *) FileType
		FileImagey:(UIImage	*) FileImagey;


+ (void) SaveToFilePlist: (NSString *) FilePath
								FileName: (NSString *) FileName
								FileType: (NSString *) FileType
							 FileArray: (NSArray	*) FileArray
									fileNO: (BOOL) fileNO;


+ (NSArray *)loadFromFile:(NSString *) FilePath
				 FileName:(NSString *) FileName
				 FileType:(NSString *) FileType;


+ (NSString *) dataFilePath:(NSString *) FilePath
				   FileName:(NSString *) FileName
				   FileType:(NSString *) FileType;

@end
