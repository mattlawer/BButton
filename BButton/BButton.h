//
//  BButton.h
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//

#import <UIKit/UIKit.h>
#import "UIColor+BButton.h"

typedef enum {
    BButtonTypeDefault = 0,
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
} BButtonType;


@interface BButton : UIButton

@property (strong, nonatomic) UIColor *color;
@property (assign, nonatomic) BButtonType type;
@property (assign, nonatomic) BOOL shouldShowDisabled;

- (id)initWithFrame:(CGRect)frame type:(BButtonType)pType;
- (void)setType:(BButtonType)newType;

@end