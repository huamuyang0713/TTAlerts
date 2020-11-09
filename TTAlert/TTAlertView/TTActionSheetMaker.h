//
//  TTActionSheetMaker.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/9.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIViewController.h>
@class TTActionSheetMaker;

NS_ASSUME_NONNULL_BEGIN

typedef void (^TTActionSheetSelectCallBack)(NSInteger index);
typedef void (^TTActionSheetCompleteCallBack)(void);
typedef TTActionSheetMaker *_Nonnull(^TTActionSheetConfigCallBack)(id arg);

@interface TTActionSheetMaker : NSObject

- (instancetype)initWithTargetVC:(UIViewController *)targetViewController;


/**
 * 配置完成 显示alert
 */
@property (nonatomic, copy, readonly) TTActionSheetCompleteCallBack show;

/**
 * 点击回调
 * 参数类型：NSInteger （取消按钮index：0，其他按钮从上到下index递增）
 */
@property (nonatomic, copy) TTActionSheetSelectCallBack selectCallBack;


/**
 * 取消按钮文案 - 可不设置取消按钮
 * 参数类型 NSString
 */
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack cancelText;
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack titleText;
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack contentText;


/**
 *标题颜色 （暂时无效）
 */
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack titleTextColor;

/**
 *内容颜色 （暂时无效）
 */
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack contentTextColor;



// default is [UIFont boldSystemFontOfSize:18]
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack titleTextFont;

// default is [UIFont boldSystemFontOfSize:16]
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack contentTextFont;


/**
 * sheet titles
 * 参数类型 NSArray<NSString *>
 */
@property (nonatomic, copy) TTActionSheetConfigCallBack itemTitles;

/**
 * sheet title color，自定义每一栏标题颜色
 * 参数类型 NSArray
 */
@property (nonatomic, copy) TTActionSheetConfigCallBack itemTitleColors;

/**
 * 统一设置每个item文字的颜色 - 优先使用itemTitleColors
 * 参数类型：UIColor
 */
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack itemTextColor;

/**
 * 取消栏文字颜色
 * 参数类型：UIColor
 */
@property (nonatomic, copy, readonly) TTActionSheetConfigCallBack cancelTextColor;

@end

NS_ASSUME_NONNULL_END
