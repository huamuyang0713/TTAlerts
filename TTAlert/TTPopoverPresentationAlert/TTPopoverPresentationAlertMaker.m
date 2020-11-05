//
//  TTPopoverPresentationAlertMaker.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import "TTPopoverPresentationAlertMaker.h"

#import <UIKit/UIApplication.h>
#import <UIKit/UIWindow.h>
#import <UIKit/UIViewController.h>
#import <UIKit/UITabBarController.h>
#import <UIKit/UINavigationController.h>

#import "TTPopoverViewController.h"
#import "TTAlertBackgroundView.h"

@interface TTPopoverPresentationAlertMaker () <UIPopoverPresentationControllerDelegate>

@property (nonatomic, strong, readonly) UIView *targetView;
@property (nonatomic, strong, readonly) UIBarButtonItem *targetBarItem;

@property (nonatomic, assign) TTAlertArrowDirection direction;
@property (nonatomic, assign) CGFloat tableWidth;
@property (nonatomic, assign) CGFloat tableCellHeight;
@property (nonatomic, assign) CGFloat bgCornerRadius;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *icons;

@property (nonatomic, strong) UIViewController *topViewController;
@property (nonatomic, assign) BOOL isCustomArrowOffset;

@end

@implementation TTPopoverPresentationAlertMaker

- (instancetype)initWithTargetView:(UIView *)targetView {
    self = [super init];
    if (self) {
        _targetView = targetView;
        [self baseSetUp];
    }
    return self;
}

- (instancetype)initWithTargetBarItem:(UIBarButtonItem *)targetBarItem {
    self = [super init];
    if (self) {
        _targetBarItem = targetBarItem;
        [self baseSetUp];
    }
    return self;
}

- (void)dealloc {
    
}

- (void)baseSetUp {
    _direction = TTAlertArrowDirectionUp;
    _tableWidth = TTTableCellWidth;
    _tableCellHeight = TTTableCellHeight;
    _bgCornerRadius = 4;
    [TTDataBus defaultBus].arrowBase = 12;
    [TTDataBus defaultBus].arrowHeight = 6;
    [TTDataBus defaultBus].arrowOffset = TTTableCellWidth / 2 - 6;
    [TTDataBus defaultBus].backgroundColor = UIColorHex(0x4B4C4D);
    [TTDataBus defaultBus].separatorColor = UIColorHex(0xEEEEEE);
}

- (void)showPopAlert {
    [self checkDefaultData];
    
    UIViewController *currentVC = [self topViewController];
    TTPopoverViewController *popAlert = [self popAlert];
    
    if (currentVC) {
        self.topViewController = currentVC;
        [currentVC presentViewController:popAlert animated:YES completion:nil];
    }
}

- (void)dismissPopOver {
    if (self.topViewController) {
        [self.topViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (TTMakerComplete)show {
    __weak typeof(self) weakSelf = self;
    TTMakerComplete block = ^(void){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showPopAlert];
    };
    return block;
}

- (TTMakerInputCallBack)arrowDirection {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([strongSelf isInteger:i]) {
            if ([i integerValue] < 5 && [i integerValue] > 0) {
                strongSelf.direction = (TTAlertArrowDirection)i;
            }
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)arrowHeight {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([strongSelf isFloat:i]) {
            [TTDataBus defaultBus].arrowHeight = [i floatValue];
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)arrowBase {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([strongSelf isFloat:i]) {
            [TTDataBus defaultBus].arrowBase = [i floatValue];
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)cellWidth {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([strongSelf isFloat:i]) {
            self.tableWidth = [i floatValue];
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)arrowOffset {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([strongSelf isFloat:i]) {
            strongSelf.isCustomArrowOffset = YES;
            [TTDataBus defaultBus].arrowOffset = [i floatValue];
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)cellHeight {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([strongSelf isFloat:i]) {
            self.tableCellHeight = [i floatValue];
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)titlesList {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSArray.class]) {
            self.titles = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)iconsList {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSArray.class]) {
            self.icons = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)backgroundColor {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            [TTDataBus defaultBus].backgroundColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTMakerInputCallBack)separatorColor {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            [TTDataBus defaultBus].separatorColor = i;
        }
        return strongSelf;
    };
    return block;

}

- (TTMakerInputCallBack)cornerRadius {
    __weak typeof(self) weakSelf = self;
    TTMakerInputCallBack block = ^TTPopoverPresentationAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([self isFloat:i]) {
            self.bgCornerRadius = [i floatValue];
        }
        return strongSelf;
    };
    return block;
}

#pragma mark - <UIPopoverPresentationControllerDelegate>
- (UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller {
    return UIModalPresentationNone;
}

#pragma mark - private
- (BOOL)isInteger:(id)input {
    NSString *s = [NSString stringWithFormat:@"%@",input];
    if (!s || s.length == 0) {
        return NO;
    }
    
    NSInteger val;
    NSScanner *scan = [NSScanner scannerWithString:s];
    return [scan scanInteger:&val] && [scan isAtEnd];
}

- (BOOL)isFloat:(id)input {
    NSString *s = [NSString stringWithFormat:@"%@",input];
    if (!s || s.length == 0) {
        return NO;
    }
    
    float val;
    NSScanner *scan = [NSScanner scannerWithString:s];
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (void)checkDefaultData {
    TTDataBus *bus = [TTDataBus defaultBus];
    if (!self.isCustomArrowOffset) {
        CGFloat offset;
        if (self.direction == TTAlertArrowDirectionUp || self.direction == TTAlertArrowDirectionDown) {
            offset = self.tableWidth / 2 - bus.arrowBase / 2;
        } else {
            offset = self.tableCellHeight * self.titles.count / 2 - bus.arrowHeight / 2;
        }
        [TTDataBus defaultBus].arrowOffset = offset;
    }
}

- (TTPopoverViewController *)popAlert {

    TTPopoverViewController *popAlert = [[TTPopoverViewController alloc] initWithTitles:self.titles andIcons:self.icons];
    popAlert.cellHeight = self.tableCellHeight;
    popAlert.cornerRadius = self.bgCornerRadius;
    popAlert.modalPresentationStyle = UIModalPresentationPopover;
    popAlert.popoverPresentationController.delegate = self;
    popAlert.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    popAlert.popoverPresentationController.backgroundColor = [TTDataBus defaultBus].backgroundColor;
    popAlert.popoverPresentationController.canOverlapSourceViewRect = YES;
    popAlert.popoverPresentationController.popoverBackgroundViewClass = TTAlertBackgroundView.class;
    
    if (self.targetBarItem) {
        popAlert.popoverPresentationController.barButtonItem = self.targetBarItem;
    } else {
        popAlert.popoverPresentationController.sourceView = self.targetView;
    }
    
    popAlert.popoverPresentationController.popoverLayoutMargins = UIEdgeInsetsMake(10, 10, 10, 10);
    CGFloat tableHeight = self.titles.count * self.tableCellHeight;
    popAlert.preferredContentSize = CGSizeMake(self.tableWidth, tableHeight);
    
    __weak typeof(self) weakSelf=  self;
    popAlert.onItemClickedCB = ^(NSInteger index) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.selectItem) {
            strongSelf.selectItem(index);
        }
    };
    return popAlert;
}

- (UIViewController *)topViewController {
    
    UIWindow *mainWindow;
    NSArray *windows = [[UIApplication sharedApplication] windows];

    for(UIWindow *window in [windows reverseObjectEnumerator]) {
        if ([window isKindOfClass:[UIWindow class]] &&
            window.windowLevel == UIWindowLevelNormal &&
            CGRectEqualToRect(window.bounds, [UIScreen mainScreen].bounds)) {

            mainWindow = window;
            break;
        }
    }

    if (!mainWindow) {
        mainWindow = [[UIApplication sharedApplication].windows firstObject];
    }
  
    
    UIViewController *currentViewController = mainWindow.rootViewController;
    
    if (currentViewController.presentedViewController != nil) {
        currentViewController = currentViewController.presentedViewController;
    }
    
    
    if ([currentViewController isKindOfClass:[UITabBarController class]]
        && ((UITabBarController*)currentViewController).selectedViewController != nil ) {
        
        currentViewController = ((UITabBarController*)currentViewController).selectedViewController;
    }
    
    while ([currentViewController isKindOfClass:[UINavigationController class]]
           && [(UINavigationController*)currentViewController topViewController]) {
        
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    }
    
    return currentViewController;
}

@end
