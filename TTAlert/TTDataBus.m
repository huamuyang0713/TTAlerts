//
//  TTDataBus.m
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/4.
//

#import "TTDataBus.h"

@implementation TTDataBus

+ (instancetype)defaultBus {
    static TTDataBus *dataBus;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (dataBus == nil) {
            dataBus = [[TTDataBus alloc] init];
            dataBus.arrowBase = 12;
            dataBus.arrowHeight = 6;
            dataBus.arrowOffset = 6;
            dataBus.backgroundColor = UIColorHex(0x4B4C4D);
            dataBus.separatorColor = UIColorHex(0xEEEEEE);
        }
    });
    return dataBus;
}

@end
