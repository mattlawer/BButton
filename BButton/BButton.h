//
//  BButton.h
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//
//  Redistribution and use in source and binary forms, with or without modification,
//  are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice,
//  this list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
// * Neither the name of Mathieu Bolard, mattlawer nor the names of its contributors
//  may be used to endorse or promote products derived from this software
//  without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
//  INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//  IN NO EVENT SHALL Mathieu Bolard BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
//  BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
@property (assign, nonatomic) BOOL shouldShowDisabled;

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame type:(BButtonType)type;
- (id)initWithFrame:(CGRect)frame type:(BButtonType)type icon:(FAIcon)icon fontSize:(CGFloat)fontSize;

- (id)initWithFrame:(CGRect)frame color:(UIColor *)aColor;
- (id)initWithFrame:(CGRect)frame color:(UIColor *)aColor icon:(FAIcon)icon fontSize:(CGFloat)fontSize;

+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon type:(BButtonType)type;
+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon color:(UIColor *)color;

#pragma mark - BButton
- (void)setType:(BButtonType)type;
- (void)addAwesomeIcon:(FAIcon)icon beforeTitle:(BOOL)before;

@end