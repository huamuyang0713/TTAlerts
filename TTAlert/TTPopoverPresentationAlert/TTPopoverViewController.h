//
//  TTPopoverViewController.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^onItemClicked)(NSInteger);

@interface TTPopoverViewController : UIViewController

- (instancetype)initWithTitles:(NSArray *)titles andIcons:(NSArray *)icons;

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, copy) onItemClicked onItemClickedCB;

@end

NS_ASSUME_NONNULL_END
