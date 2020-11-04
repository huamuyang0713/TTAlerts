//
//  UIBarButtonItem+TTPopoverPresentationAlert.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/4.
//

#import "UIBarButtonItem+TTPopoverPresentationAlert.h"

@implementation UIBarButtonItem (TTPopoverPresentationAlert)

- (void)ttAlertWithConfig:(void(^)(TTPopoverPresentationAlertMaker *))block {
    TTPopoverPresentationAlertMaker *maker = [[TTPopoverPresentationAlertMaker alloc] initWithTargetBarItem:self];
    block(maker);
}

@end
