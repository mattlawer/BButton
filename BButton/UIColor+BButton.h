//
//  UIColor+BButton.h
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//
//
//  BButton is licensed under the MIT license
//  http://opensource.org/licenses/MIT
//
//
//  -----------------------------------------
//  Edited and refactored by Jesse Squires on 2 April, 2013.
//
//  http://github.com/jessesquires/BButton
//
//  http://hexedbits.com
//

#import <UIKit/UIKit.h>

@interface UIColor (BButton)

#pragma mark - Custom colors
+ (UIColor *)defaultColorV2;
+ (UIColor *)defaultColorV3;

+ (UIColor *)primaryColorV2;
+ (UIColor *)primaryColorV3;

+ (UIColor *)infoColorV2;
+ (UIColor *)infoColorV3;

+ (UIColor *)successColorV2;
+ (UIColor *)successColorV3;

+ (UIColor *)warningColorV2;
+ (UIColor *)warningColorV3;

+ (UIColor *)dangerColorV2;
+ (UIColor *)dangerColorV3;

+ (UIColor *)inverseColorV2;
+ (UIColor *)inverseColorV3;

+ (UIColor *)twitterColor;
+ (UIColor *)facebookColor;
+ (UIColor *)purpleBButtonColor;
+ (UIColor *)grayBButtonColor;

#pragma mark - Utilities
- (UIColor *)desaturatedColorToPercentSaturation:(CGFloat)percent;
- (UIColor *)lightenColorWithValue:(CGFloat)value;
- (UIColor *)darkenColorWithValue:(CGFloat)value;
- (BOOL)isLightColor;

@end