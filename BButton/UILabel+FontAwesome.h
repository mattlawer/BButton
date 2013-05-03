//
//  UILabel+FontAwesome.h
//
//
//  Created by André Silva on 03/05/13.
//  Copyright (c) 2013 André Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"

@interface UILabel (FontAwesome)

+ (UILabel *)labelWithAwesomeIcon:(FAIcon)icon fontSize:(CGFloat)size;
- (void)addAwesomeIcon:(FAIcon)icon;
- (void)addAwesomeIcon:(FAIcon)icon fontSize:(CGFloat)size;

@end
