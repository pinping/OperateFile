//
//  PPOperateFile.m
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import "PPOperateFile.h"

@implementation PPOperateFile



+(NSArray *)PPCrossQuadrature:(NSArray *)mArray subArray:(NSArray *)sArray
{
		NSMutableArray	*mianArr = [NSMutableArray arrayWithArray:mArray];
		NSMutableArray  *subArr = [NSMutableArray arrayWithArray:sArray];
		for (int i = 0; i<[mianArr count]; i++) {
				if ([subArr containsObject:[mianArr objectAtIndex:i]]) {
						
						[mianArr removeObjectAtIndex:i];
				}
		}
		
		
		return mianArr;
}


+ (void)PPSaveImgToFile:(NSString *)aPath Name:(NSString *)aName Imagey:(UIImage *)aImagey breviary:(BOOL)aBool
{
    NSString *filePath = [self PPdataFilePath:aPath FileName:aName FileType:PPjpgType];
		NSString *filePathPro = [self PPdataFilePath:aPath FileName:[aName stringByAppendingString:SmallPicture] FileType:PPjpgType];
    if (aBool) {
				UIImage	*tempImg = [aImagey PPImgScaleToWidth:150.0f];
				[UIImageJPEGRepresentation(tempImg , 1.0f) writeToFile:filePathPro atomically:YES];
				[UIImageJPEGRepresentation(aImagey , 1.0f) writeToFile:filePath atomically:YES];
				tempImg = nil;
		} else {
        [UIImageJPEGRepresentation(aImagey , 1.0f) writeToFile:filePath atomically:YES];
    }
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
+ (void)PPsaveToFile    :(NSString *)FilePath
        FilePlist       :(NSString *)FilePlist
        FilePlistType   :(NSString *)FilePlistType
        FileName        :(NSString *)FileName
        FileArray       :(NSArray *)FileArray
        FileImagey      :(UIImage *)FileImagey
{
		
		
    [UIImageJPEGRepresentation(FileImagey, 1.0f) writeToFile:[self PPdataFilePath:FilePath FileName:FileName FileType:PPjpgType] atomically:YES];

    int     imgW = FileImagey.size.width;
    int     imgH = FileImagey.size.height;
    UIImage *temp = nil;

    if (imgW > imgH) {
        temp = [FileImagey PPreSizeImage:CGSizeMake(150, 216)];
    }

    if (imgH > imgW) {
        temp = [FileImagey PPreSizeImage:CGSizeMake(150, 216)];
    }

    [UIImageJPEGRepresentation(temp, 1.0f) writeToFile:[self PPdataFilePath:FilePath FileName:[FileName stringByAppendingString:SmallPicture] FileType:PPjpgType] atomically:YES];
		if (FilePlist) {
				[self PPsaveToFilePlist:FilePlist FileName:[PPAuxiliary generateTradeNOPlist] FileType:FilePlistType FileArray:FileArray fileNO:YES];
		}
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
+ (void)PPsaveToFilePlist   :(NSString *)FilePath
        FileName            :(NSString *)FileName
        FileType            :(NSString *)FileType
        FileArray           :(NSArray *)FileArray
        fileNO              :(BOOL)fileNO
{
    NSString *pathStr = [self PPdataFilePath:FilePath FileName:FileName FileType:FileType];

    if ([FileArray count] > 0) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:pathStr] && fileNO) {
            NSMutableArray *zongPlist = [[NSMutableArray alloc] initWithArray:[self PPloadFromFile:FilePath FileName:FileName FileType:FileType]];
            [zongPlist addObjectsFromArray:FileArray];
            [zongPlist writeToFile:pathStr atomically:NO];
            [zongPlist release];
            zongPlist = nil;
        } else {
            [FileArray writeToFile:pathStr atomically:NO];
        }
    }
}

+ (void)PPsaveToFilePlist   :(NSString *)FilePath
        FileName            :(NSString *)FileName
        FileType            :(NSString *)FileType
        FileArray           :(NSArray *)FileArray
        fileNO              :(BOOL)fileNO
										 Sorting:(BOOL)aSort
{
    NSString *pathStr = [self PPdataFilePath:FilePath FileName:FileName FileType:FileType];
		
    if ([FileArray count] > 0) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:pathStr] && fileNO) {
						if (aSort) {
								NSMutableArray *zongPlist = [[NSMutableArray alloc] initWithArray:[self PPloadFromFile:FilePath FileName:FileName FileType:FileType]];
								NSMutableIndexSet *indexes = [NSMutableIndexSet indexSetWithIndex:0];
								[zongPlist insertObjects:FileArray atIndexes:indexes];
								[zongPlist writeToFile:pathStr atomically:NO];
								[zongPlist release];
								zongPlist = nil;
						}else{
								NSMutableArray *zongPlist = [[NSMutableArray alloc] initWithArray:[self PPloadFromFile:FilePath FileName:FileName FileType:FileType]];
								[zongPlist addObjectsFromArray:FileArray];
								[zongPlist writeToFile:pathStr atomically:NO];
								[zongPlist release];
								zongPlist = nil;
						}
            
        } else {
            [FileArray writeToFile:pathStr atomically:NO];
        }
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
+ (NSArray *)   PPloadFromFile  :(NSString *)FilePath
                FileName        :(NSString *)FileName
                FileType        :(NSString *)FileType
{
    NSString *filePath = [self PPdataFilePath:FilePath FileName:FileName FileType:FileType];

    NSArray *arrays = nil;

    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        arrays = [[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
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
+ (NSString *)  PPdataFilePath  :(NSString *)FilePath
                FileName        :(NSString *)FileName
                FileType        :(NSString *)FileType
{
    NSString    *path;
    NSString    *type;
    BOOL        bo;

    if (FilePath) {
        path = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:FilePath];
    } else {
        path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    }

    if (FileType) {
        type = [FileName stringByAppendingString:FileType];
    } else {
        type = FileName;
    }

    if (FileName) {
        bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        return [path stringByAppendingPathComponent:type];
    } else {
        bo = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
        return path;
    }

    NSAssert(bo, @"查找失败");
}

+ (void)PPdeleteFilePath:(NSString *)FilePath
        FileName        :(NSDictionary *)aDict
        FileType        :(NSString *)FileType
{

    NSArray *queryNumber = [NSArray arrayWithArray:[PPAuxiliary PPqueryFilePath:FilePath error:nil]];
    for (int i = 0; i < [queryNumber count]; i++) {
        NSString        *imgStr = [queryNumber objectAtIndex:i];
        NSMutableArray  *plistArray = [NSMutableArray arrayWithArray:[self PPloadFromFile:FilePath FileName:imgStr FileType:nil]];
        [plistArray removeObject:aDict];
//				NSString *tempStr = [aDict objectForKey:@"picturename"];
//				NSString *path1 = [self PPdataFilePath:takePicture FileName:tempStr FileType:PPjpgType];
//				[[NSFileManager defaultManager] removeItemAtPath:path1 error:nil];
//				
//				tempStr = [tempStr stringByAppendingString:SmallPicture];
//				path1 = [self PPdataFilePath:takePicture FileName:tempStr FileType:PPjpgType];
//				[[NSFileManager defaultManager] removeItemAtPath:path1 error:nil];
				
        if ([plistArray count] == 0) {
            NSString *path1 = [self PPdataFilePath:FilePath FileName:imgStr FileType:nil];
            [[NSFileManager defaultManager] removeItemAtPath:path1 error:nil];
        } else {
            [plistArray writeToFile:[self PPdataFilePath:FilePath FileName:imgStr FileType:nil] atomically:YES];
        }
    }
}



+ (void)PPdeleteToFile  :(NSString *)FilePath
        FileName        :(NSString *)FileName
        FileType        :(NSString *)FileType
{
    NSString *filePath = [self PPdataFilePath:FilePath FileName:FileName FileType:FileType];
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

@end