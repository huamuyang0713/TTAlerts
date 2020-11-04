//
//  TTPopoverPresentationAlertMaker.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIView.h>
#import "TTDataBus.h"

@class TTPopoverPresentationAlertMaker;

typedef TTPopoverPresentationAlertMaker *_Nonnull(^TTMakerInputCallBack)(id _Nullable arg);
typedef void (^TTMakerComplete)(void);
typedef void (^TTPopAlertTapedItem)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface TTPopoverPresentationAlertMaker : NSObject

- (instancetype)initWithTargetView:(UIView *)targetView;
- (instancetype)initWithTargetBarItem:(UIBarButtonItem *)targetBarItem;


/**
 * 配置完成 显示alert
 */
@property (nonatomic, copy, readonly) TTMakerComplete show;


/**
 * 点击回调
 */
@property (nonatomic, copy) TTPopAlertTapedItem selectItem;


/**
 * cell 标题
 * 参数类型：NSArray
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack titlesList;

/**
 * cell icon - 与titleList个数对应
 * 参数类型：NSArray
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack iconsList;

/**
 * 参数类型：TTAlertArrowDirection - 暂时只支持up
 * default：TTAlertArrowDirectionUp
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack arrowDirection;

/**
 * 箭头高  default is 6.0
 * 参数类型：NSNumber
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack arrowHeight;

/**
 * 箭头宽  default is 12.0
 * 参数类型：NSNumber
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack arrowBase;

/**
 * cell宽 default is 140
 * 参数类型：NSNumber
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack cellWidth;


/**
 * 箭头偏移量： up & dowm : 箭头左边距 left & right ：上边距 default is arrowBase/2
 * 参数类型：NSNumber
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack arrowOffset;

/**
 * 参数类型：NSNumber default:44
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack cellHeight;


/**
 * 背景色
 * 参数类型：UIColor
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack backgroundColor;

/**
 * 分割线颜色
 * 参数类型：UIColor
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack separatorColor;

/**
 * 整体圆角 - default is 4.0
 * 参数类型：NSNumber
 */
@property (nonatomic, copy, readonly) TTMakerInputCallBack cornerRadius;


@end

NS_ASSUME_NONNULL_END
