//
//  UIBarButtonItem+TTPopoverPresentationAlert.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/4.
//

#import <UIKit/UIKit.h>
#import "TTPopoverPresentationAlertMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (TTPopoverPresentationAlert)

- (void)ttPopoverPresentationAlertWithConfig:(void(^)(TTPopoverPresentationAlertMaker *maker))block onSelectItem:(TTPopAlertTapedItem)selectCallBack;

- (void)dismissPopOverAlert;


//private
@property (nonatomic, strong, readonly, nullable) TTPopoverPresentationAlertMaker *configurationMaker;

@end

NS_ASSUME_NONNULL_END
