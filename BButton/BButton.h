//
//  BButton.h
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
#import "UIColor+BButton.h"
#import "NSString+FontAwesome.h"

typedef NS_ENUM(NSUInteger, BButtonStyle) {
    BButtonStyleBootstrapV2,
    BButtonStyleBootstrapV3
};


typedef NS_ENUM(NSUInteger, BButtonType) {
    BButtonTypeDefault,
    BButtonTypePrimary,
    BButtonTypeInfo,
    BButtonTypeSuccess,
    BButtonTypeWarning,
    BButtonTypeDanger,
    BButtonTypeInverse,
    BButtonTypeTwitter,
    BButtonTypeFacebook,
    BButtonTypePurple,
    BButtonTypeGray
};


@interface BButton : UIButton <UIAppearance>

@property (strong, nonatomic) UIColor *color;
@property (strong, nonatomic) NSNumber *buttonCornerRadius UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) BOOL shouldShowDisabled;

#pragma mark - Initialization

- (id)initWithFrame:(CGRect)frame type:(BButtonType)type style:(BButtonStyle)aStyle;

- (id)initWithFrame:(CGRect)frame
               type:(BButtonType)type
              style:(BButtonStyle)aStyle
               icon:(FAIcon)icon
           fontSize:(CGFloat)fontSize;

- (id)initWithFrame:(CGRect)frame color:(UIColor *)aColor style:(BButtonStyle)aStyle;

- (id)initWithFrame:(CGRect)frame
              color:(UIColor *)aColor
              style:(BButtonStyle)aStyle
               icon:(FAIcon)icon
           fontSize:(CGFloat)fontSize;

+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon
                                  type:(BButtonType)type
                                 style:(BButtonStyle)aStyle;

+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon
                                 color:(UIColor *)color
                                 style:(BButtonStyle)aStyle;

#pragma mark - BButton

- (void)setType:(BButtonType)type;
- (void)addAwesomeIcon:(FAIcon)icon beforeTitle:(BOOL)before;

@end