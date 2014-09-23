//
//  PPOperateFile.h
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPAuxiliary.h"
// #import "MacPublicImoprt.h"
#import "UIImage+PPImageScale.h"
// #import "UIColor+PPColor.h"
// #import "NSString+PPString.h"
// #import "PPTime.h"

@class PPAuxiliary;

@interface PPOperateFile : NSObject

#define ITUNESLOOKUPURL @"http://itunes.apple.com/lookup?id=730746256"
#define PPplistType     @".plist"
#define PPjpgType       @".jpg"
#define APPCONFIG       @"appconfig"
#define netWork         @"netWorkState"
#define APPVERSION      @"Version"
#define APPVERSIOND     @"VersionDetection"
#define SmallPicture    @"small"           // 小图



/**
 *  传入2数组,一个父数组,一个子数组.然后把父数组里面与子数组相交的部分清除;返回该数组,
 *
 *  @param mArray 父数组
 *  @param sArray 子数组
 *
 *  @return 返回该数组
 */
+ (NSArray *)   PPCrossQuadrature   :(NSArray *)mArray
                subArray            :(NSArray *)sArray;


+ (void)PPSaveImgToFile :(NSString *)aPath
        Name            :(NSString *)aName
        Imagey          :(UIImage *)aImagey
        breviary        :(BOOL)aBool;

+ (void)PPsaveToFile    :(NSString *)FilePath
        FilePlist       :(NSString *)FilePlist
        FilePlistType   :(NSString *)FilePlistType
        FileName        :(NSString *)FileName
        FileArray       :(NSArray *)FileArray
        FileImagey      :(UIImage *)FileImagey;

+ (void)PPsaveToFilePlist   :(NSString *)FilePath
        FileName            :(NSString *)FileName
        FileType            :(NSString *)FileType
        FileArray           :(NSArray *)FileArray
        fileNO              :(BOOL)fileNO;

+ (void)PPsaveToFilePlist   :(NSString *)FilePath
        FileName            :(NSString *)FileName
        FileType            :(NSString *)FileType
        FileArray           :(NSArray *)FileArray
        fileNO              :(BOOL)fileNO
        Sorting             :(BOOL)aSort;

+ (void)PPdeleteFilePath:(NSString *)FilePath
        FileName        :(NSDictionary *)aDict
        FileType        :(NSString *)FileType;

/**
 *  删除指定文件
 *
 *  @param FilePath 指定文件路径
 *  @param FileName 指定文件名称
 *  @param FileType 指定文件类型
 */
+ (void)PPdeleteToFile:(NSString *)FilePath FileName:(NSString *)FileName FileType:(NSString *)FileType;

/**
 *	@brief	通过《dataFilePath》方法查找到指定的文件，读取文件的数据，返回数据。
 *
 *  @param	FilePath  指定文件路径
 *
 *  @param	FileName  指定文件名称
 *
 *  @param	FileType  指定文件类型
 *
 *	@return	返回一个NSArray的数据。
 */
+ (NSArray *)PPloadFromFile:(NSString *)FilePath FileName:(NSString *)FileName FileType:(NSString *)FileType;
/**
 *	@brief	查找指定文件价指定名称的文件类型，如果文件存在返回文件的路径，反之返回一个路径。
 *
 *  @param	FilePath  指定文件路径
 *
 *  @param	FileName  指定文件名称
 *
 *  @param	FileType  指定文件类型
 *
 *	@return	返回查找到的路径字符串
 */
+ (NSString *)PPdataFilePath:(NSString *)FilePath FileName:(NSString *)FileName FileType:(NSString *)FileType;
@end