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
- (UIImage *)scaleToWidth:(float)width
{
		
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
- (UIImage *)scaleToHeight:(float)height
{
		
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
-(UIImage*)scaleToSize:(CGSize)size
{
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


/**
 *	@brief	通过传入的text往UIImage上写字
 *
 *  @param	往UIImage上写字
 *
 *	@return	返回新图片
 */
-(UIImage *)addText:(NSString *)text1
{

    int w = self.size.width;
    int h = self.size.height;
		
				//lon = h - lon;
		
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), self.CGImage);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1);
		
		
    char* text  = (char *)[text1 cStringUsingEncoding:NSASCIIStringEncoding];// "05/05/09";
    CGContextSelectFont(context, "Arial", 18, kCGEncodingMacRoman);
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetRGBFillColor(context, 255, 255, 255, 1);
		
				//rotate text
		
    CGContextSetTextMatrix(context, CGAffineTransformMakeRotation( -M_PI/4 ));
    CGContextShowTextAtPoint(context, 4, 52, text, strlen(text));
		CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
		
    return [UIImage imageWithCGImage:imageMasked];
}


-(UIImage *)imageFromText:(NSString *)text
{
		UIFont *font = [UIFont systemFontOfSize:20.0];
		CGSize size  = [text sizeWithFont:font];
		UIGraphicsBeginImageContext(size);
		UIGraphicsGetCurrentContext();
				// optional: add a shadow
				// optional: also, to avoid clipping you should make the context size bigger     CGContextSetShadowWithColor(ctx, CGSizeMake(2.0, -2.0), 5.0, [[UIColor grayColor] CGColor]);
				// draw in context
		[text drawAtPoint:CGPointMake(0.0, 0.0) withFont:font];
				// transfer image
		UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		return image;  
}


//代码让UIImage具有渐变效果
- (UIImage *) imageWithBackgroundColor:(UIColor *)bgColor
                           shadeAlpha1:(CGFloat)alpha1
                           shadeAlpha2:(CGFloat)alpha2
                           shadeAlpha3:(CGFloat)alpha3
                           shadowColor:(UIColor *)shadowColor
                          shadowOffset:(CGSize)shadowOffset
                            shadowBlur:(CGFloat)shadowBlur
{
    UIImage *image = self;
    CGColorRef cgColor = [bgColor CGColor];
    CGColorRef cgShadowColor = [shadowColor CGColor];
    CGFloat components[16] = {1,1,1,alpha1,1,1,1,alpha1,1,1,1,alpha2,1,1,1,alpha3};
    CGFloat locations[4] = {0,0.5,0.6,1};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef colorGradient = CGGradientCreateWithColorComponents(colorSpace, components, locations, (size_t)4);
    CGRect contextRect;
    contextRect.origin.x = 0.0f;
    contextRect.origin.y = 0.0f;
    contextRect.size = [image size];
				//contextRect.size = CGSizeMake([image size].width+5,[image size].height+5);
				// Retrieve source image and begin image context
    UIImage *itemImage = image;
    CGSize itemImageSize = [itemImage size];
    CGPoint itemImagePosition;
    itemImagePosition.x = ceilf((contextRect.size.width - itemImageSize.width) / 2);
    itemImagePosition.y = ceilf((contextRect.size.height - itemImageSize.height) / 2);
    UIGraphicsBeginImageContext(contextRect.size);
    CGContextRef c = UIGraphicsGetCurrentContext();
				// Setup shadow
    CGContextSetShadowWithColor(c, shadowOffset, shadowBlur, cgShadowColor);
				// Setup transparency layer and clip to mask
    CGContextBeginTransparencyLayer(c, NULL);
    CGContextScaleCTM(c, 1.0, -1.0);
    CGContextClipToMask(c, CGRectMake(itemImagePosition.x, -itemImagePosition.y, itemImageSize.width, -itemImageSize.height), [itemImage CGImage]);
				// Fill and end the transparency layer
    CGContextSetFillColorWithColor(c, cgColor);
    contextRect.size.height = -contextRect.size.height;
    CGContextFillRect(c, contextRect);
    CGContextDrawLinearGradient(c, colorGradient,CGPointZero,CGPointMake(contextRect.size.width*1.0/4.0,contextRect.size.height),0);
    CGContextEndTransparencyLayer(c);
				//CGPointMake(contextRect.size.width*3.0/4.0, 0)
				// Set selected image and end context
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(colorGradient);
    return resultImage;
}

@end
