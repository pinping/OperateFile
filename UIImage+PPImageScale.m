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



static void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight)
{
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    
    CGContextMoveToPoint(context, fw, fh/2);  // Start at lower right corner
    CGContextAddArcToPoint(context, fw, fh, fw/2, fh, 1);  // Top right corner
    CGContextAddArcToPoint(context, 0, fh, 0, fh/2, 1); // Top left corner
    CGContextAddArcToPoint(context, 0, 0, fw/2, 0, 1); // Lower left corner
    CGContextAddArcToPoint(context, fw, 0, fw, fh/2, 1); // Back to lower right
    
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}


- (id) createRoundedRectImage:(UIImage*)image size:(CGSize)size ovalWidth:(float)ovalWidth ovalHeight:(float)ovalHeight
{
		// the size of CGContextRef
    int w = size.width;
    int h = size.height;
    
    UIImage *img = image;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    CGContextBeginPath(context);
    addRoundedRectToPath(context, rect, ovalWidth, ovalHeight);
    CGContextClosePath(context);
    CGContextClip(context);
    CGContextDrawImage(context, CGRectMake(0, 0, w, h), img.CGImage);
    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
		 UIImage *finalImage = [UIImage imageWithCGImage:imageMasked]; 
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
		CGImageRelease(imageMasked); 
    return finalImage;
}



- (UIImage *)PPImgScaleToWidth:(float)width
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
//		UIGraphicsEndImageContext();
		return scaledImage;
}


- (UIImage *)PPImgScaleToHeight:(float)height
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


-(UIImage *)PPImgScaleToSize:(CGSize)size
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
		NSLog(@"scaledImage%@",scaledImage);
		NSLog(@"image%f",scaledImage.size.height);
		NSLog(@"image%f",scaledImage.size.width);
		return scaledImage;
}



-(UIImage *)PPAddText:(NSString *)text1
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
		UIImage *finalImage = [UIImage imageWithCGImage:imageMasked];
    CGImageRelease(imageMasked);
    CGColorSpaceRelease(colorSpace);
		CGContextRelease(context);
		
    return finalImage;
}


-(UIImage *)PPimageFromText:(NSString *)text
{
		NSLog(@"%f",self.size.width);
		UIFont *font = [UIFont systemFontOfSize:self.size.height/2];
		CGSize size  = [text sizeWithFont:font];
		UIGraphicsBeginImageContext(self.size);
		CGContextRef context = UIGraphicsGetCurrentContext();
		CGContextSetAllowsAntialiasing(context, true);
    CGContextSetShouldAntialias(context, true);
		// optional: add a shadow
		// optional: also, to avoid clipping you should make the context size bigger     CGContextSetShadowWithColor(ctx, CGSizeMake(2.0, -2.0), 5.0, [[UIColor grayColor] CGColor]);
		// draw in context
		[self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
		UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
		[fillColor setFill];
		[text drawAtPoint:CGPointMake((self.size.width-size.width)/2,(self.size.height-size.height)/2) withFont:font];
		
		// transfer image
		UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		return image;
}



- (UIImage *)PPreSizeImage:(CGSize)reSize
{
		
		CGRect myImageRect = CGRectMake((self.size.width-(reSize.width))/2,
																		(self.size.height-(reSize.height))/2,
																		reSize.width, reSize.height);
		
    CGImageRef imageRef = self.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    UIGraphicsBeginImageContext(reSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage *smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
		CGImageRelease(subImageRef);
//		CGContextRelease(context);
    return smallImage;
		
}



- (UIImage *)PPreSizeImageHeight:(float)height
{
		
		CGRect myImageRect = CGRectMake( 0, (self.size.height - height)/2, self.size.width, height);
		
    CGImageRef imageRef = self.CGImage;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    UIGraphicsBeginImageContext(CGSizeMake(self.size.width, height));
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage *smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
		CGImageRelease(subImageRef);
		//		CGContextRelease(context);
    return smallImage;
		
}



-(UIImage *)PPImgcomposeTemplate:(UIImage *)aImg subImg:(UIImage *)bImg
{
		NSLog(@"%f",aImg.size.width);
		NSLog(@"%f",aImg.size.height);
		CGRect  imgRect = CGRectMake(0, 0, aImg.size.width, aImg.size.height);
		CGRect  image01Rect = CGRectMake(0, 0, aImg.size.width, aImg.size.height);
		UIGraphicsBeginImageContext(aImg.size);
		[aImg drawInRect:imgRect];
		[bImg drawInRect:image01Rect];
		UIImage *temp = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		temp = [temp createRoundedRectImage:temp size:aImg.size ovalWidth:aImg.size.width / 6 ovalHeight:aImg.size.width / 6];
		return temp;
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



- (UIImage *)fixOrientation {
		
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
		
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
		
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
						
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
						
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
    }
		
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
						
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
    }
		
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
						
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
		
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}




@end
