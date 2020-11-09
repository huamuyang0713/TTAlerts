//
//  TTActionSheetMaker.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/9.
//

#import "TTActionSheetMaker.h"
#import "TTAlertViewController.h"
#import "TTAlertAction.h"

@interface TTActionSheetMaker ()

@property (nonatomic, strong, readonly) UIViewController *targetVC;
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) NSString *contentStr;
@property (nonatomic, strong) NSString *cancelStr;

@property (nonatomic, strong) UIColor *cancelColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *contentColor;
@property (nonatomic, strong) UIColor *textColor;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *contentFont;

@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) NSArray *itemColors;

@end

@implementation TTActionSheetMaker

- (instancetype)initWithTargetVC:(UIViewController *)targetViewController {
    if (self = [super init]) {
        _targetVC = targetViewController;
        _textColor = UIColor.blackColor;
        _titleFont = [UIFont boldSystemFontOfSize:18];
        _contentFont = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (TTActionSheetCompleteCallBack)show {
    __weak typeof(self) weakSelf = self;
    TTActionSheetCompleteCallBack block = ^(void){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showActionSheet];
    };
    return block;
}

- (void)showActionSheet {
    if (!self.targetVC || self.items.count < 1) {
        return;
    }
    
    TTAlertViewController *alertVC = [TTAlertViewController alertControllerWithTitle:self.titleStr message:self.contentStr preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (self.titleStr && self.titleStr.length) {
        NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:self.titleStr];
        [titleAttr addAttributes:@{
            NSFontAttributeName: self.titleFont,
            NSForegroundColorAttributeName: self.titleColor ?: self.textColor
                                   
        } range:NSMakeRange(0, self.titleStr.length)];
        [alertVC setValue:titleAttr forKey:@"attributedTitle"];
    }
    
    if (self.contentStr && self.contentStr.length) {
        NSMutableAttributedString *contentAttr = [[NSMutableAttributedString alloc] initWithString:self.contentStr];
        [contentAttr addAttributes:@{
            NSFontAttributeName: self.contentFont,
            NSForegroundColorAttributeName: self.contentColor == nil ? self.textColor : self.contentColor
                                   
        } range:NSMakeRange(0, self.contentStr.length)];
        [alertVC setValue:contentAttr forKey:@"attributedMessage"];
    }
    
    __weak typeof(self) weakSelf = self;
    for (NSInteger i = 0; i < self.items.count; i++) {
        NSString *s =  self.items[i];
        TTAlertAction *action = [TTAlertAction actionWithTitle:s style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (weakSelf.selectCallBack) {
                NSInteger index = i;
                if (weakSelf.cancelStr && weakSelf.cancelStr.length) {
                    index += 1;
                }
                weakSelf.selectCallBack(index);
            }
        }];
        
        
        if (self.itemColors.count > i) {
            action.textColor = self.itemColors[i];
        } else {
            action.textColor = self.textColor;
        }
        
        [alertVC addAction:action];
    }

    
    
    if (self.cancelStr && self.cancelStr.length) {
        TTAlertAction *cancelAction = [TTAlertAction actionWithTitle:self.cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (weakSelf.selectCallBack) {
                weakSelf.selectCallBack(0);
            }
        }];
        
        
        if (self.cancelColor) {
            cancelAction.textColor = self.cancelColor;
        }
        
        [alertVC addAction:cancelAction];
    }
    
    [self.targetVC presentViewController:alertVC animated:YES completion:nil];
}


- (TTActionSheetConfigCallBack)cancelText {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSString.class]) {
            strongSelf.cancelStr = i;
        } else {
            strongSelf.cancelStr = nil;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)titleText {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSString.class]) {
            strongSelf.titleStr = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)contentText {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSString.class]) {
            strongSelf.contentStr = i;
        }
        return strongSelf;
    };
    return block;
}


- (TTActionSheetConfigCallBack)itemTitles {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSArray.class]) {
            strongSelf.items = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)itemTitleColors {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSArray.class]) {
            strongSelf.itemColors = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)itemTextColor {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.textColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)cancelTextColor {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.cancelColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)titleTextColor {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.titleColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)contentTextColor {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.contentColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)titleTextFont {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIFont.class]) {
            strongSelf.titleFont = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTActionSheetConfigCallBack)contentTextFont {
    __weak typeof(self) weakSelf = self;
    TTActionSheetConfigCallBack block = ^TTActionSheetMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIFont.class]) {
            strongSelf.contentFont = i;
        }
        return strongSelf;
    };
    return block;
}

@end
