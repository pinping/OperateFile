//
//  PPOperateFile.h
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPAuxiliary.h"
#import "MacPublicDefine.h"


@class PPAuxiliary;

@interface PPOperateFile : NSObject


+ (void)PPsaveToFile: (NSString *) FilePath
					 FilePlist: (NSString *) FilePlist
			 FilePlistType: (NSString *) FilePlistType
						FileName: (NSString *) FileName
						FileType: (NSString *) FileType
					FileImagey: (UIImage	*) FileImagey;


+ (void)PPsaveToFilePlist: (NSString *) FilePath
								 FileName: (NSString *) FileName
								 FileType: (NSString *) FileType
								FileArray: (NSArray	*) FileArray
									 fileNO: (BOOL) fileNO;


+ (NSArray *)PPloadFromFile: (NSString *) FilePath
									 FileName: (NSString *) FileName
									 FileType: (NSString *) FileType;


+ (NSString *)PPdataFilePath: (NSString *) FilePath
										FileName: (NSString *) FileName
										FileType: (NSString *) FileType;


+ (void)PPdeleteFilePath: (NSString *) FilePath
								FileName: (NSString *) FileName
								FileType: (NSString *) FileType;


@end
