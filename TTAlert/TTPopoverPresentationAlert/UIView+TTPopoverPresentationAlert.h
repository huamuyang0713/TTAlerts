//
//  UIView+TTPopoverPresentationAlert.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import <UIKit/UIKit.h>
#import "TTPopoverPresentationAlertMaker.h"


NS_ASSUME_NONNULL_BEGIN

@interface UIView (TTPopoverPresentationAlert)

- (void)ttAlertWithConfig:(void(^)(TTPopoverPresentationAlertMaker *maker))block;

@end

NS_ASSUME_NONNULL_END
