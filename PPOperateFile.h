//
//  PPOperateFile.h
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPAuxiliary.h"

@class PPAuxiliary;

@interface PPOperateFile : NSObject


+ (void)saveToFile: (NSString *) FilePath
				 FilePlist: (NSString *) FilePlist
		 FilePlistType: (NSString *) FilePlistType
					FileName: (NSString *) FileName
					FileType: (NSString *) FileType
				FileImagey: (UIImage	*) FileImagey;


+ (void) SaveToFilePlist: (NSString *) FilePath
								FileName: (NSString *) FileName
								FileType: (NSString *) FileType
							 FileArray: (NSArray	*) FileArray
									fileNO: (BOOL) fileNO;


+ (NSArray *)loadFromFile: (NSString *) FilePath
								 FileName: (NSString *) FileName
								 FileType: (NSString *) FileType;


+ (NSString *) dataFilePath: (NSString *) FilePath
									 FileName: (NSString *) FileName
									 FileType: (NSString *) FileType;
@end
