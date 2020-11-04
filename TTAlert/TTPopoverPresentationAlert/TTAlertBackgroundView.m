//
//  TTAlertBackgroundView.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import "TTAlertBackgroundView.h"
#import "TTDataBus.h"

@implementation TTAlertBackgroundView {
    CGFloat _arrowOffset ;
    UIPopoverArrowDirection _direction;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.layer.shadowColor = UIColor.clearColor.CGColor;
    }
    return self;
}

+ (CGFloat)arrowBase {
    return [TTDataBus defaultBus].arrowBase;
}

+ (CGFloat)arrowHeight {
    return [TTDataBus defaultBus].arrowHeight;
}

+ (UIEdgeInsets)contentViewInsets {
    return UIEdgeInsetsZero;
}

- (UIPopoverArrowDirection)arrowDirection {
    return _direction;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection {
    _direction = arrowDirection;
}

- (CGFloat)arrowOffset {
    return [TTDataBus defaultBus].arrowOffset;
}

- (void)setArrowOffset:(CGFloat)arrowOffset {
    _arrowOffset = arrowOffset;
}

- (void)drawRect:(CGRect)rect {
    CGFloat height = [[self class] arrowHeight];
    CGFloat base = [[self class] arrowBase];
    CGFloat offset = [TTDataBus defaultBus].arrowOffset;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, offset, height);
    CGContextAddLineToPoint(context, offset + base / 2, 0);
    CGContextAddLineToPoint(context, offset + base, height);
    CGContextClosePath(context);

    [[TTDataBus defaultBus].backgroundColor setFill];

    [[TTDataBus defaultBus].backgroundColor setStroke];

    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
