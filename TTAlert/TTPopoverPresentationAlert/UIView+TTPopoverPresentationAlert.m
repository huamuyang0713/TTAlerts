//
//  UIView+TTPopoverPresentationAlert.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import "UIView+TTPopoverPresentationAlert.h"

@implementation UIView (TTPopoverPresentationAlert)

- (void)ttAlertWithConfig:(void(^)(TTPopoverPresentationAlertMaker *))block {
    TTPopoverPresentationAlertMaker *maker = [[TTPopoverPresentationAlertMaker alloc] initWithTargetView:self];
    block(maker);
}

@end
