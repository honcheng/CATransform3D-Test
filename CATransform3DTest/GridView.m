//
//  GridView.m
//  CATransform3DTest
//
//  Created by honcheng on 6/2/13.
//  Copyright (c) 2013 Hon Cheng Muh. All rights reserved.
//

#import "GridView.h"
#import <QuartzCore/QuartzCore.h>

@implementation GridView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef contextRef = UIGraphicsGetCurrentContext();

    CGContextSetFillColorWithColor(contextRef, [UIColor lightGrayColor].CGColor);
    CGContextMoveToPoint(contextRef, self.frame.size.width, 0);
    CGContextAddLineToPoint(contextRef, self.frame.size.width, self.frame.size.height);
    CGContextAddLineToPoint(contextRef, 0, self.frame.size.height);
    CGContextClosePath(contextRef);
    CGContextFillPath(contextRef);
    
    int size = 10.0;
    CGContextSetFillColorWithColor(contextRef, [UIColor blackColor].CGColor);
    for (int i=0; i<=self.frame.size.width; i+=size)
    {
        CGContextFillRect(contextRef, CGRectMake(i, 0, 1, self.frame.size.height));
    }
    for (int j=0; j<=self.frame.size.height; j+=size)
    {
        CGContextFillRect(contextRef, CGRectMake(0, j, self.frame.size.width, 1));
    }
    
    CGContextSetFillColorWithColor(contextRef, [UIColor redColor].CGColor);
    CGPoint anchorPoint = self.layer.anchorPoint;
    float radius = 5.0;
    CGContextFillEllipseInRect(contextRef, CGRectMake(anchorPoint.x*rect.size.width-radius, anchorPoint.y*rect.size.height-radius, 2*radius, 2*radius));
}


@end
