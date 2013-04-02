/** 
	@file	UIImage+PPImageScale.m
	@brief
	@author	pinping
	@version 1.0.0
	@data	13-3-22
  Copyright (c) 2013年 maclove. All rights reserved.
*/

#import "UIImage+PPImageScale.h"

@implementation UIImage (PPImageScale)

/**
 *	@brief	通过传入的width来等比缩小或放大图片
 *
 *  @param	width 需要图片尺寸的宽度
 *
 *	@return	返回新的改变大小后的图片
 */
- (UIImage *)scaleToWidth:(float)width{
		
		CGSize size = CGSizeMake(width, self.size.height/(self.size.width/width));
		// 创建一个bitmap的context
		// 并把它设置成为当前正在使用的context
		UIGraphicsBeginImageContext(size);
		// 绘制改变大小的图片
		[self drawInRect:CGRectMake(0, 0, size.width, size.height)];
		// 从当前context中创建一个改变大小后的图片
		UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
		// 使当前的context出堆栈
		UIGraphicsEndImageContext();
		return scaledImage;
}

/**
 *	@brief	通过传入的height来等比缩小或放大图片
 *
 *  @param	height 需要图片尺寸的高度
 *
 *	@return	返回新的改变大小后的图片
 */
- (UIImage *)scaleToHeight:(float)height{
		
		CGSize size = CGSizeMake(self.size.width/(self.size.height/height), height);
		// 创建一个bitmap的context
		// 并把它设置成为当前正在使用的context
		UIGraphicsBeginImageContext(size);
		// 绘制改变大小的图片
		[self drawInRect:CGRectMake(0, 0, size.width, size.height)];
		// 从当前context中创建一个改变大小后的图片
		UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
		// 使当前的context出堆栈
		UIGraphicsEndImageContext();
		return scaledImage;
		
}

/**
 *	@brief	通过传入的size来等比缩小或放大图片
 *
 *  @param	size 需要图片尺寸
 *
 *	@return	返回新的改变大小后的图片
 */
-(UIImage*)scaleToSize:(CGSize)size{
		// 创建一个bitmap的context
		// 并把它设置成为当前正在使用的context
		UIGraphicsBeginImageContext(size);
		// 绘制改变大小的图片
		[self drawInRect:CGRectMake(0, 0, size.width, size.height)];
		// 从当前context中创建一个改变大小后的图片
		UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
		// 使当前的context出堆栈
		UIGraphicsEndImageContext();
		// 返回新的改变大小后的图片
		return scaledImage;
}
@end
