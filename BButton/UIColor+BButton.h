//
//  UIColor+BButton.h
//
//  Created by Jesse Squires on 4/2/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//
//
//  -----------------------------------------
//  Edited by Jesse Squires on 2 April, 2013.
//
//  http://github.com/jessesquires/BButton
//
//  http://hexedbits.com
//

#import <UIKit/UIKit.h>

@interface UIColor (BButton)

- (UIColor *)lightenColorWithValue:(CGFloat)value;
- (UIColor *)darkenColorWithValue:(CGFloat)value;
- (BOOL)isLightColor;

@end