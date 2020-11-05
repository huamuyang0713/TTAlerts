//
//  UIView+TTPopoverPresentationAlert.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import "UIView+TTPopoverPresentationAlert.h"
#import <objc/runtime.h>
#import "TTDataBus.h"

@implementation UIView (TTPopoverPresentationAlert)

- (void)ttPopoverPresentationAlertWithConfig:(void (^)(TTPopoverPresentationAlertMaker * _Nonnull))block onSelectItem:(TTPopAlertTapedItem)selectCallBack {
    TTPopoverPresentationAlertMaker *maker = [[TTPopoverPresentationAlertMaker alloc] initWithTargetView:self];
    maker.selectItem = selectCallBack;
    self.configurationMaker = maker;
    block(maker);
}

- (void)dismissPopOverAlert {
    [self.configurationMaker dismissPopOver];
    self.configurationMaker = nil;
}

- (TTPopoverPresentationAlertMaker *)configurationMaker {
    return objc_getAssociatedObject(self, @selector(configurationMaker));
}

- (void)setConfigurationMaker:(TTPopoverPresentationAlertMaker *)configurationMaker {
    objc_setAssociatedObject(self, @selector(configurationMaker), configurationMaker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)dealloc {
    self.configurationMaker = nil;
}

@end
