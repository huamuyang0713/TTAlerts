//
//  ViewController.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/3.
//

#import "ViewController.h"
#import "UIView+TTPopoverPresentationAlert.h"
#import "TTPopoverViewController.h"
#import "TTDataBus.h"
#import "TTAlertBackgroundView.h"
#import "UIBarButtonItem+TTPopoverPresentationAlert.h"

#import "UIViewController+TTAlert.h"

//UIPopoverPresentationControllerDelegate
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;

@end

@implementation ViewController
- (IBAction)popAlertButtonClick:(id)sender {
    [self.button ttPopoverPresentationAlertWithConfig:^(TTPopoverPresentationAlertMaker * _Nonnull maker) {
        maker.titlesList(@[@"123", @"456", @"789"]).iconsList(@[@"img1",@"img2",@"img3",@"img4"]).backgroundColor(UIColor.redColor).cornerRadius(@4).separatorColor(UIColor.blueColor).arrowBase(@30).arrowHeight(@15).cellWidth(@200).cellHeight(@80).show();
    } onSelectItem:^(NSInteger index) {
        NSLog(@"---select item at:%ld", index);
        [self.button dismissPopOverAlert];
    }];
    
}

- (IBAction)rightBarButtonAction:(id)sender {
    [self.rightBarButton ttPopoverPresentationAlertWithConfig:^(TTPopoverPresentationAlertMaker * _Nonnull maker) {
        maker.titlesList(@[@"zzz", @"qwer", @"hask"]).arrowOffset(@115).show();
    } onSelectItem:^(NSInteger index) {
        NSLog(@"---select item at:%ld", index);
        [self.rightBarButton dismissPopOverAlert];
    }];
}

- (IBAction)alertButtonClick:(id)sender {
    NSAttributedString *contentAttrStr = [[NSAttributedString alloc] initWithString:@"去上班的女孩走红。视频中女孩为了踩点上班，一路狂奔冲到公司楼下，让不少网友直呼“不进国家队可惜了”。据李女士自" attributes:@{NSForegroundColorAttributeName: UIColor.blueColor}];
    [self ttAlertShowWithConfig:^(TTAlertMaker * _Nonnull maker) {
        maker.titleText(@"notice").contentText(contentAttrStr).titleTextColor(UIColor.yellowColor).contentTextColor(UIColor.blueColor).cancelText(@"取消1").cancelTextColor(UIColor.cyanColor).show();
    } onSureCallBack:^{
        NSLog(@"---alert sure");
    } onCancelCallBack:^{
        NSLog(@"--alert cancel");
    }];
}

- (IBAction)sheetButtonClick:(id)sender {
    [self ttActionSheetShowWithConfig:^(TTActionSheetMaker * _Nonnull maker) {
        maker.itemTitles(@[@"123", @"456"]).cancelText(@"cancel").contentText(@"sheet content").itemTitleColors(@[UIColor.blueColor]).titleText(@"this is a sheet").titleTextFont([UIFont systemFontOfSize:12]).titleTextColor(UIColor.cyanColor).contentTextColor(UIColor.redColor).show();
    } onSelectItem:^(NSInteger index) {
        NSLog(@"--- action sheet click: %ld", index);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

@end
