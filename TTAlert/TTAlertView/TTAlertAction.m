//
//  TTAlertAction.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/9.
//

#import "TTAlertAction.h"
#import <objc/runtime.h>

@implementation TTAlertAction

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UIAlertAction class], &count);
    
    for(int i =0;i < count;i ++){
        Ivar ivar = ivars[i];
        NSString *ivarName = [NSString stringWithCString:ivar_getName(ivar) encoding:NSUTF8StringEncoding];
        if ([ivarName isEqualToString:@"_titleTextColor"]) {
            [self setValue:textColor forKey:@"titleTextColor"];
        }
      }
}

@end
