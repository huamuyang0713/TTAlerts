//
//  TTAlertMaker.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
@class TTAlertMaker;

NS_ASSUME_NONNULL_BEGIN

typedef TTAlertMaker *_Nonnull(^TTAlertMakerObjConfigCallBack)(id _Nullable arg);
typedef TTAlertMaker *_Nonnull(^TTAlertMakerNumberConfigCallBack)(CGFloat arg);
typedef void (^TTAlertMakerComplete)(void);
typedef void (^TTAlertTapedItem)(void);

@interface TTAlertMaker : NSObject

- (instancetype)initWithTargetVC:(UIViewController *)targetViewController;

- (void)dismissAlert;


/**
 * 配置完成 显示alert
 */
@property (nonatomic, copy, readonly) TTAlertMakerComplete show;

/**
 * 点击回调
 */
@property (nonatomic, copy) TTAlertTapedItem sureCallBack;

@property (nonatomic, copy) TTAlertTapedItem cancelCallBack;


/**
 * 取消文案
 * 参数类型 NSString
 * ps：传人nil则不显示取消按钮
 */
@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack cancelText;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack sureText;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack titleText;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack contentText;

/**
 * 背景色
 * 参数类型：UIColor
 */
//@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack backgroundColor;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack cancelTextColor;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack sureTextColor;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack titleTextColor;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack contentTextColor;

/**
 * 字体大小
 * NSnumber
 */
@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack titleTextFont;

@property (nonatomic, copy, readonly) TTAlertMakerObjConfigCallBack contentTextFont;

@end

NS_ASSUME_NONNULL_END
