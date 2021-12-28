//
//  TTAlertMaker.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/9.
//

#import "TTAlertMaker.h"
#import "TTAlertViewController.h"
#import "TTAlertAction.h"

@interface TTAlertMaker ()

@property (nonatomic, strong, readonly) UIViewController *targetVC;

@property (nonatomic, strong) UIColor *cancelColor;
@property (nonatomic, strong) UIColor *sureColor;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *contentColor;

@property (nonatomic, strong) NSString *cancelStr;
@property (nonatomic, strong) NSString *sureStr;
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) NSString *titleAttrStr;
@property (nonatomic, strong) NSString *contentStr;
@property (nonatomic, strong) NSString *contentAttrStr;

@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIFont *contentFont;

@end

@implementation TTAlertMaker

- (instancetype)initWithTargetVC:(UIViewController *)targetViewController {
    self = [super init];
    if (self) {
        _targetVC = targetViewController;
        _sureStr = @"确定";
        _cancelStr = @"取消";
        _sureColor =UIColor.blueColor;
        _cancelColor = UIColor.lightGrayColor;
        _titleColor = UIColor.blackColor;
        _contentColor = UIColor.blackColor;
        _titleFont = [UIFont boldSystemFontOfSize:18];
        _contentFont = [UIFont systemFontOfSize:16];
    }
    return self;
}

- (void)dismissAlert {
    if (self.targetVC.presentedViewController) {
        [self.targetVC dismissViewControllerAnimated:YES completion:nil];
    }
}

- (TTAlertMakerComplete)show {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerComplete block = ^(void){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf showAlert];
    };
    return block;
}

- (void)showAlert {
    if (!self.targetVC) {
        return;
    }
    
    TTAlertViewController *alertVC = [TTAlertViewController alertControllerWithTitle:self.titleStr message:self.contentStr preferredStyle:UIAlertControllerStyleAlert];
    
    if (self.titleAttrStr) {
        [alertVC setValue:self.titleAttrStr forKey:@"attributedTitle"];
    } else if (self.titleStr && self.titleStr.length) {
        NSMutableAttributedString *titleAttr = [[NSMutableAttributedString alloc] initWithString:self.titleStr];
        [titleAttr addAttributes:@{
            NSFontAttributeName: self.titleFont,
            NSForegroundColorAttributeName: self.titleColor
                                   
        } range:NSMakeRange(0, self.titleStr.length)];
        [alertVC setValue:titleAttr forKey:@"attributedTitle"];
    }
    
    if (self.contentAttrStr) {
        [alertVC setValue:self.contentAttrStr forKey:@"attributedMessage"];
    } else if (self.contentStr && self.contentStr.length) {
        NSMutableAttributedString *contentAttr = [[NSMutableAttributedString alloc] initWithString:self.contentStr];
        [contentAttr addAttributes:@{
            NSFontAttributeName: self.contentFont,
            NSForegroundColorAttributeName: self.contentColor
                                   
        } range:NSMakeRange(0, self.contentStr.length)];
        [alertVC setValue:contentAttr forKey:@"attributedMessage"];
    }
    
    __weak typeof(self) weakSelf = self;
    if (self.cancelStr && self.cancelStr.length) {
        TTAlertAction *cancelAction = [TTAlertAction actionWithTitle:self.cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            if (weakSelf.cancelCallBack) {
                weakSelf.cancelCallBack();
            }
        }];
        
        
        if (self.cancelColor) {
            cancelAction.textColor = self.cancelColor;
        }
        
        [alertVC addAction:cancelAction];
    }
    
    TTAlertAction *sureAction = [TTAlertAction actionWithTitle:self.sureStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (weakSelf.sureCallBack) {
            weakSelf.sureCallBack();
        }
    }];
    
    if (self.sureColor) {
        sureAction.textColor = self.sureColor;
    }
    
    [alertVC addAction:sureAction];
    
    [self.targetVC presentViewController:alertVC animated:YES completion:nil];
}

- (TTAlertMakerObjConfigCallBack)cancelTextColor {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.cancelColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)sureTextColor {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.sureColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)titleTextColor {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.titleColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)contentTextColor {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIColor.class]) {
            strongSelf.contentColor = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)cancelText {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
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

- (TTAlertMakerObjConfigCallBack)sureText {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSString.class]) {
            strongSelf.sureStr = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)titleText {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSString.class]) {
            strongSelf.titleStr = i;
        } else if ([i isKindOfClass:NSAttributedString.class]) {
            strongSelf.titleStr = [(NSAttributedString *)i string];
            strongSelf.titleAttrStr = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)contentText {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:NSString.class]) {
            strongSelf.contentStr = i;
        } else if ([i isKindOfClass:NSAttributedString.class]) {
            strongSelf.contentStr = [(NSAttributedString *)i string];
            strongSelf.contentAttrStr = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)titleTextFontSize {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIFont.class]) {
            strongSelf.titleFont = i;
        }
        return strongSelf;
    };
    return block;
}

- (TTAlertMakerObjConfigCallBack)contentTextFontSize {
    __weak typeof(self) weakSelf = self;
    TTAlertMakerObjConfigCallBack block = ^TTAlertMaker *(id i){
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if ([i isKindOfClass:UIFont.class]) {
            strongSelf.contentFont = i;
        }
        return strongSelf;
    };
    return block;
}

@end
