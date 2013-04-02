//
//  BButton.h
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//

#import <UIKit/UIKit.h>

typedef enum {
    BButtonTypeDefault = 0,
    BButtonTypePrimary,
    BButtonTypeInfo,
    BButtonTypeSuccess,
    BButtonTypeWarning,
    BButtonTypeDanger,
    BButtonTypeInverse,
    BSButtonTypeTwitter,
    BSButtonTypeFacebook,
    BSButtonTypePurple,
    BSButtonTypeGray
} BButtonType;

@interface BButton : UIButton {
    UIColor *_color;
    CGGradientRef _gradient;
}

@property (nonatomic, assign) UIColor *color;

- (void)setType:(BButtonType)type;

@end
