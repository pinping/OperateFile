/**
 *    @file	UIImage+PPImageScale.h
 *    @brief
 *    @author	pinping
 *    @version 1.0.0
 *    @data	13-3-22
 *   Copyright (c) 2013年 maclove. All rights reserved.
 */
#import <UIKit/UIKit.h>

@interface UIImage (PPImageScale)

/**
 *	@brief	通过传入的width,height来修改图片的圆角
 *
 *  @param	size 图片尺寸的宽度
 *
 *  @param	ovalWidth 需要生成图片的圆角Width
 *
 *  @param	ovalHeight 需要生成图片的圆角Height
 *
 *	@return	返回修改的图片
 */
- (id)createRoundedRectImage:(UIImage *)image size:(CGSize)size ovalWidth:(float)ovalWidth ovalHeight:(float)ovalHeight;

/**
 *	@brief	通过传入的width来等比缩小或放大图片
 *
 *  @param	width 需要图片尺寸的宽度
 *
 *	@return	返回新的改变大小后的图片
 */
- (UIImage *)PPImgScaleToWidth:(float)width;

/**
 *	@brief	通过传入的height来等比缩小或放大图片
 *
 *  @param	height 需要图片尺寸的高度
 *
 *	@return	返回新的改变大小后的图片
 */
- (UIImage *)PPImgScaleToHeight:(float)height;

/**
 *	@brief	通过传入的size来等比缩小或放大图片
 *
 *  @param	size 需要图片尺寸
 *
 *	@return	返回新的改变大小后的图片
 */
- (UIImage *)PPImgScaleToSize:(CGSize)size;

/**
 *	@brief	在图片上居中位置截取reSize的大小的图像，产生一个新的reSize大小的图片。
 *
 *  @param	新图片的大小
 *
 *	@return	返回新图片
 */
- (UIImage *)PPreSizeImage:(CGSize)reSize;


/**
 *	@brief	在图片上居中位置截取reSize的大小的图像，产生一个新的reSize大小的图片。
 *
 *  @param	新图片的大小
 *
 *	@return	返回新图片
 */
- (UIImage *)PPreSizeImageHeight:(float)height;


/**
 *	@brief	通过传入的text往UIImage上写字
 *
 *  @param	往UIImage上写字
 *
 *	@return	返回新图片
 */
- (UIImage *)PPAddText:(NSString *)text1;

/**
 *	@brief	通过传入的text往UIImage上写字
 *
 *  @param	往UIImage上写字
 *
 *	@return	返回新图片
 */
- (UIImage *)PPimageFromText:(NSString *)text;

- (UIImage *)PPImgcomposeTemplate:(UIImage *)aImg subImg:(UIImage *)bImg;

/**
 *	@brief	如果拍照或导入的图片在程序里面显示是旋转,本方法调整图片方向。
 *
 *	@return	返回新图片
 */
- (UIImage *)fixOrientation;

@end