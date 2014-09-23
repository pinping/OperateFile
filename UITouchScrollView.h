//
//  UITouchScrollView.h
//  PPPublicClass
//
//  Created by iMac on 14-9-17.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol UIScrollViewTouchesDelegate
-(void)scrollViewTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event whichView:(id)scrollView;
@end

@interface UITouchScrollView : UIScrollView

@property(nonatomic,assign) id<UIScrollViewTouchesDelegate> touchesdelegate;

@end
