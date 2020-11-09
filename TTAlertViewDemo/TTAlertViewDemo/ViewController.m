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
    [self ttAlertShowWithConfig:^(TTAlertMaker * _Nonnull maker) {
        maker.titleText(@"提示").contentText(@"近日，新疆乌鲁木齐。一名狂奔去上班的女孩走红。视频中女孩为了踩点上班，一路狂奔冲到公司楼下，让不少网友直呼“不进国家队可惜了”。据李女士自己介绍，因为家住得离公司比较近，再加上平时早上起床比较困难，所以每次上班都是踩着点到公司，在路上基本上都是一路奔跑。老板和同事就把她每天跑步上班的画面拍了下来，让她成了公司的“网红”。甚至为了拍她上班奔跑的视频，同事和老板还专门提前上班在窗台上等待。").titleTextColor(UIColor.redColor).contentTextColor(UIColor.blueColor).cancelText(nil).show();
    } onSureCallBack:^{
        NSLog(@"---alert sure");
    } onCancelCallBack:^{
        NSLog(@"--alert cancel");
    }];
}

- (IBAction)sheetButtonClick:(id)sender {
    [self ttActionSheetShowWithConfig:^(TTActionSheetMaker * _Nonnull maker) {
        maker.itemTitles(@[@"123", @"456"]).cancelText(@"cancel").show();
    } onSelectItem:^(NSInteger index) {
        NSLog(@"--- action sheet click: %ld", index);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

@end
