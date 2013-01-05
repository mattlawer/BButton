//
//  BButton+FontAwesome.m
//  ReportApp
//
//  Created by Pit Garbe on 27.09.12.
//  Copyright (c) 2012 Pit Garbe. All rights reserved.
//

#import "BButton+FontAwesome.h"

static const NSArray *awesomeStrings;

@implementation BButton (FontAwesome)

+ (instancetype)awesomeButtonWithIcon:(FAIcon)icon {
    return [BButton awesomeButtonWithIcon:icon color:nil];
}

+ (instancetype)awesomeButtonWithIcon:(FAIcon)icon color:(UIColor *)color {
    return [BButton awesomeButtonWithIcon:icon color:color fontSize:14];
}

+ (instancetype)awesomeButtonWithIcon:(FAIcon)icon color:(UIColor *)color fontSize:(CGFloat)fontSize {

    BButton *awesomeButton = [[BButton alloc] init];
    
    if (color) {
        awesomeButton.color = color;
    }

    awesomeButton.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
    [awesomeButton setTitle:[BButton stringFromAwesomeIcon:icon] forState:UIControlStateNormal];

    [awesomeButton performSelector:@selector(constrainFontToButtonSize) withObject:nil afterDelay:0];
    
    return awesomeButton;
}

- (void)makeAwesomeWithIcon:(FAIcon)icon {
    [self makeAwesomeWithIcon:icon color:nil];
}

- (void)makeAwesomeWithIcon:(FAIcon)icon color:(UIColor *)color {
    [self makeAwesomeWithIcon:icon color:color fontSize:self.titleLabel.font.pointSize];
}

- (void)makeAwesomeWithIcon:(FAIcon)icon color:(UIColor *)color fontSize:(CGFloat)fontSize {
    NSString *iconString = [BButton stringFromAwesomeIcon:icon];
    self.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
    [self setTitle:iconString forState:UIControlStateNormal];

    [self constrainFontToButtonSize];

    if (color) {
        self.color = color;
    }
}

- (void)constrainFontToButtonSize {
    NSString *iconString = self.titleLabel.text;

    CGSize size = [iconString sizeWithFont:self.titleLabel.font forWidth:self.bounds.size.width lineBreakMode:NSLineBreakByCharWrapping];
    UIFont *font = self.titleLabel.font;

    while (size.width == 0 || CGRectGetMinY(self.titleLabel.frame) < 2 || CGRectGetMaxY(self.titleLabel.frame) > self.bounds.size.height - 2) {
        CGFloat fontSize = [font pointSize];
        fontSize -= 1;
        font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
        self.titleLabel.font = font;
        size = [iconString sizeWithFont:font forWidth:self.bounds.size.width lineBreakMode:NSLineBreakByCharWrapping];
    }
}

+ (NSString *)stringFromAwesomeIcon:(FAIcon)icon {
    if (!awesomeStrings) {
        awesomeStrings = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    }
    
    return [awesomeStrings objectAtIndex:icon];
}

@end


