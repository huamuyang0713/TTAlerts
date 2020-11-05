//
//  TTDataBus.h
//  TTAlertViewDemo
//
//  Created by 何强 on 2020/11/4.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define TTTableCellHeight 46.0
#define TTTableCellWidth 140.0

#define UIColorHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


typedef NS_ENUM(NSUInteger, TTAlertArrowDirection) {
    TTAlertArrowDirectionUp = 1,
    TTAlertArrowDirectionDown = 2,
    TTAlertArrowDirectionLeft = 3,
    TTAlertArrowDirectionRight = 4
};

@interface TTDataBus : NSObject

+ (instancetype)defaultBus;

// - popoverAlert
@property (nonatomic, assign, readwrite) float arrowBase;
@property (nonatomic, assign, readwrite) float arrowHeight;
@property (nonatomic, assign, readwrite) float arrowOffset;
@property (nonatomic, strong, readwrite) UIColor *backgroundColor;
@property (nonatomic, strong, readwrite) UIColor *separatorColor;

// -

@end

NS_ASSUME_NONNULL_END
