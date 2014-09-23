//
//  PPHexadScale.h
//  PPPublicClass
//
//  Created by pinping on 14-5-20.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPHexadScale : NSObject

/**
 *	@brief	把10进制的整形转换成16进制的字符串
 *
 *  @param	10进制的整形
 *
 *	@return	16进制的字符串
 */
+ (int)PPHexToDec:(NSString *)aDec;

/**
 *	@brief	把16进制的字符串转换成10进制的整形
 *
 *  @param	16进制的字符串
 *
 *	@return	10进制的整形
 */
+ (NSString *)PPDecToHex:(int)aHex;


@end
