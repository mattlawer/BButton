//
//  UILabel+FontAwesome.m
//
//
//  Created by André Silva on 03/05/13.
//  Copyright (c) 2013 7Noites. All rights reserved.
//

#import "UILabel+FontAwesome.h"

@implementation UILabel (FontAwesome)

+ (UILabel *)labelWithAwesomeIcon:(FAIcon)icon fontSize:(CGFloat)size {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.font = [UIFont fontWithName:@"FontAwesome" size:size];
    return label;
}

- (void)addAwesomeIcon:(FAIcon)icon {
    [self addAwesomeIcon:icon fontSize:self.font.pointSize];
}

- (void)addAwesomeIcon:(FAIcon)icon fontSize:(CGFloat)size {
    self.font = [UIFont fontWithName:@"FontAwesome" size:size];
    self.text = [NSString stringFromAwesomeIcon:icon];
}

@end
