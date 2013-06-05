//
//  PPOperateFile.m
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPOperateFile.h"

@implementation PPOperateFile



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
+ (void)PPsaveToFile: (NSString *) FilePath
					 FilePlist: (NSString *) FilePlist
			 FilePlistType: (NSString *) FilePlistType
						FileName: (NSString *) FileName
						FileType: (NSString *) FileType
					FileImagey: (UIImage	*) FileImagey
{
		
    [UIImageJPEGRepresentation(FileImagey, 1.0f) writeToFile:[self PPdataFilePath:FilePath FileName:FileName FileType:FileType] atomically:YES];
		
    NSArray	*ssss=[[NSArray alloc] initWithObjects:FileName, nil];
		
		
    [self PPsaveToFilePlist:FilePlist FileName:[PPAuxiliary generateTradeNOPlist] FileType:FilePlistType FileArray:ssss fileNO:YES];
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
+ (void)PPsaveToFilePlist: (NSString *) FilePath
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
		
		if ([[NSFileManager defaultManager] fileExistsAtPath:[self PPdataFilePath:FilePath FileName:FileName FileType:FileType]] && fileNO) {
       	NSMutableArray	*zongPlist =[[NSMutableArray alloc]initWithArray:[self	PPloadFromFile:FilePath FileName:FileName FileType:FileType]];
        [zongPlist addObjectsFromArray:FileArray];
        [[PPAuxiliary MacLoveRepeat:zongPlist] writeToFile:[self PPdataFilePath:FilePath FileName:FileName FileType:FileType] atomically:YES];
        [zongPlist release];
        zongPlist	=	nil;
    }else {
        [[PPAuxiliary MacLoveRepeat:FileArray] writeToFile:[self PPdataFilePath:FilePath FileName:FileName FileType:FileType] atomically:YES];
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
+ (id)PPloadFromFile:(NSString *) FilePath
						FileName:(NSString *) FileName
						FileType:(NSString *) FileType
{
		
    NSString *filePath=[self PPdataFilePath:FilePath FileName:FileName FileType:FileType];
		NSLog(@"filePath = %@ ", filePath);
		
		NSArray *arrays = nil;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        arrays=[[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    }
		NSLog(@"arrays = %@ ", arrays);
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
+ (NSString *)PPdataFilePath:(NSString *) FilePath
										FileName:(NSString *) FileName
										FileType:(NSString *) FileType
{
		
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
		}else{
				type = FileName;
		}
		
    if (FileName) {
				bo= [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        return [path stringByAppendingPathComponent:type];
    }else {
        bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        return path;
    }
		NSAssert(bo,@"查找失败");
		
}



+ (void)PPdeleteFilePath: (NSString *) FilePath
								FileName: (NSString *) FileName
								FileType: (NSString *) FileType
{
		
		NSString *filePath = [self PPdataFilePath:FilePath FileName:FileName FileType:FileType];
		[[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
		
		NSArray *queryNumber = [NSArray arrayWithArray:[PPAuxiliary queryFilePath:FilePath]];
		
		for (int i=0; i<[queryNumber count]; i++) {
				NSString	*imgStr = [queryNumber objectAtIndex:i];
				NSMutableArray	*plistArray =  [NSMutableArray arrayWithArray:[self PPloadFromFile:FilePath
																																								 FileName:imgStr
																																								 FileType:PPplistType]];
				
				[plistArray removeObject:FileName];
			
				if ([plistArray count] == 0) {
						
            NSLog(@"loadFromFilePlist%@",plistArray);
            NSString *path1 = [self PPdataFilePath:FilePath FileName:imgStr FileType:PPplistType];
            [[NSFileManager defaultManager] removeItemAtPath:path1 error:nil];
            
        }else{
						
						[plistArray writeToFile:[self PPdataFilePath:FilePath FileName:imgStr FileType:PPplistType] atomically:YES];
				}
    }
		
}

@end
