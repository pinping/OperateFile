//
//  PPOperateFile.h
//  定制
//
//  Created by pinping on 13-4-16.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPAuxiliary.h"
#import "MacPublicImoprt.h"
#import "UIImage+PPImageScale.h"
#import "UIColor+PPColor.h"
#import "NSString+PPString.h"
#import "PPTime.h"

@class PPAuxiliary;

@interface PPOperateFile : NSObject


+(NSArray *)PPCrossQuadrature:(NSArray *)mArray subArray:(NSArray *)sArray;

+ (void)PPSaveImgToFile:(NSString *)aPath Name:(NSString *)aName Imagey:(UIImage *)aImagey breviary:(BOOL)aBool;

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

+ (void)PPdeleteToFile  :(NSString *)FilePath
        FileName        :(NSString *)FileName
        FileType        :(NSString *)FileType;

+ (NSArray *)   PPloadFromFile  :(NSString *)FilePath
                FileName        :(NSString *)FileName
                FileType        :(NSString *)FileType;

+ (NSString *)  PPdataFilePath  :(NSString *)FilePath
                FileName        :(NSString *)FileName
                FileType        :(NSString *)FileType;

@end