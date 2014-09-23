//
//  UIColor+PPColor.h
//  定制
//
//  Created by pinping on 13-6-29.
//  Copyright (c) 2013年 maclove. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PPColor)

/**
 *  传入一个颜色的字符串,通过本方法调用进制转换的方法把字符串转换为UIColor;
 *
 *  @param hexString 颜色字符串
 *
 *  @return UIColor的颜色
 */
- (UIColor *) PPColorWithHexString: (NSString *) hexString;


/**
 *  传入一个颜色的字符串,通过本方法颜色字符串进行位移转换为UIColor;
 *
 *  @param hexString 颜色字符串
 *
 *  @return UIColor的颜色
 */
- (UIColor *)PPGetColor:(NSString *)hexString;

@end
