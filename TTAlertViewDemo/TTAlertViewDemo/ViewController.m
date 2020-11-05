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

//UIPopoverPresentationControllerDelegate
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBarButton;

@end

@implementation ViewController
- (IBAction)btnClick:(id)sender {
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

@end
