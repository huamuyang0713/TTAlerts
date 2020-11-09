//
//  UIViewController+TTAlert.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/9.
//

#import "UIViewController+TTAlert.h"
#import <objc/runtime.h>

@implementation UIViewController (TTAlert)

- (void)ttAlertShowWithConfig:(void (^)(TTAlertMaker * _Nonnull))block {
    [self ttAlertShowWithConfig:block onSureCallBack:nil];
}

- (void)ttAlertShowWithConfig:(void (^)(TTAlertMaker * _Nonnull))block onSureCallBack:(TTAlertTapedItem)sure {
    [self ttAlertShowWithConfig:block onSureCallBack:sure onCancelCallBack:nil];
}

- (void)ttAlertShowWithConfig:(void (^)(TTAlertMaker * _Nonnull))block onSureCallBack:(TTAlertTapedItem)sure onCancelCallBack:(TTAlertTapedItem)cancel {
    TTAlertMaker *maker = [[TTAlertMaker alloc] initWithTargetVC:self];
    maker.sureCallBack = sure;
    maker.cancelCallBack = cancel;
    self.configurationMaker = maker;
    block(maker);
}

- (void)ttActionSheetShowWithConfig:(void (^)(TTActionSheetMaker * _Nonnull))block onSelectItem:(nullable TTActionSheetSelectCallBack)selecCallBack{
    TTActionSheetMaker *maker = [[TTActionSheetMaker alloc] initWithTargetVC:self];
    maker.selectCallBack = selecCallBack;
    self.configurationActionSheetMaker = maker;
    block(maker);
}

//- (void)dismissAlert {
//    [self.configurationMaker dismissAlert];
//    self.configurationMaker = nil;
//}

- (TTAlertMaker *)configurationMaker {
    return objc_getAssociatedObject(self, @selector(configurationMaker));
}

- (void)setConfigurationMaker:(TTAlertMaker *)configurationMaker {
    objc_setAssociatedObject(self, @selector(configurationMaker), configurationMaker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TTActionSheetMaker *)configurationActionSheetMaker {
    return objc_getAssociatedObject(self, @selector(configurationActionSheetMaker));
}

- (void)setConfigurationActionSheetMaker:(TTActionSheetMaker * _Nullable)configurationActionSheetMaker {
    objc_setAssociatedObject(self, @selector(configurationActionSheetMaker), configurationActionSheetMaker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



@end
