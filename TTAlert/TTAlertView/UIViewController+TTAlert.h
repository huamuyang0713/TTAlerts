//
//  UIViewController+TTAlert.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/9.
//

#import <UIKit/UIKit.h>
#import "TTAlertMaker.h"
#import "TTActionSheetMaker.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TTAlert)

// - alert
- (void)ttAlertShowWithConfig:(void(^)(TTAlertMaker *maker))block;
- (void)ttAlertShowWithConfig:(void(^)(TTAlertMaker *maker))block onSureCallBack:(nullable TTAlertTapedItem)sure;
- (void)ttAlertShowWithConfig:(void(^)(TTAlertMaker *maker))block onSureCallBack:(nullable TTAlertTapedItem)sure onCancelCallBack:(nullable TTAlertTapedItem)cancel;

// - action sheet
- (void)ttActionSheetShowWithConfig:(void(^)(TTActionSheetMaker *maker))block onSelectItem:(nullable TTActionSheetSelectCallBack)selecCallBack;


//private
@property (nonatomic, strong, readonly, nullable) TTAlertMaker *configurationMaker;
@property (nonatomic, strong, readonly, nullable) TTActionSheetMaker *configurationActionSheetMaker;

@end

NS_ASSUME_NONNULL_END
