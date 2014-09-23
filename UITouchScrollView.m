//
//  UITouchScrollView.m
//  PPPublicClass
//
//  Created by iMac on 14-9-17.
//  Copyright (c) 2014年 PP. All rights reserved.
//

#import "UITouchScrollView.h"

@implementation UITouchScrollView


@synthesize touchesdelegate=_touchesdelegate;

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
    
    if (!self.dragging) {
        //run at ios5 ,no effect;
        [self.nextResponder touchesEnded:touches withEvent:event];
        if (_touchesdelegate != nil) {
            
            [_touchesdelegate scrollViewTouchesEnded:touches withEvent:event whichView:self];
        }
        NSLog(@"UITouchScrollView nextResponder touchesEnded");
    }
    [super touchesEnded:touches withEvent:event];
    
}
@end

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
