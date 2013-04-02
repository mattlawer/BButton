//
//  BButton+FontAwesome.m
//
//  Created by Pit Garbe on 27.09.12.
//  Copyright (c) 2012 Pit Garbe. All rights reserved.
//
//  https://github.com/leberwurstsaft/FontAwesome-for-iOS
//

#import "BButton+FontAwesome.h"

static const NSArray *awesomeStrings;


@implementation BButton (FontAwesome)

#pragma mark - Class
+ (BButton *)awesomeButtonWithIcon:(FAIcon)icon
{
    return [BButton awesomeButtonWithIcon:icon color:nil];
}

+ (BButton *)awesomeButtonWithIcon:(FAIcon)icon color:(UIColor *)color
{
    return [BButton awesomeButtonWithIcon:icon color:color fontSize:17.0f frame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)];
}

+ (BButton *)awesomeButtonWithIcon:(FAIcon)icon
                             color:(UIColor *)color
                          fontSize:(CGFloat)fontSize
                             frame:(CGRect)frame
{
    BButton *awesomeButton = [[BButton alloc] initWithFrame:frame];
    
    if(color) {
        awesomeButton.color = color;
    }

    awesomeButton.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
    awesomeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [awesomeButton setTitle:[BButton stringFromAwesomeIcon:icon] forState:UIControlStateNormal];
    
    [awesomeButton performSelector:@selector(constrainFontToButtonSize)];
    
    return awesomeButton;
}

#pragma mark - Instance
- (void)makeAwesomeWithIcon:(FAIcon)icon
{
    [self makeAwesomeWithIcon:icon color:nil];
}

- (void)makeAwesomeWithIcon:(FAIcon)icon color:(UIColor *)color
{
    [self makeAwesomeWithIcon:icon
                        color:color
                     fontSize:self.titleLabel.font.pointSize];
}

- (void)makeAwesomeWithIcon:(FAIcon)icon color:(UIColor *)color fontSize:(CGFloat)fontSize
{
    NSString *iconString = [BButton stringFromAwesomeIcon:icon];
    self.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
    
    [self setTitle:[NSString stringWithFormat:@"%@  %@", iconString, self.titleLabel.text]
          forState:UIControlStateNormal];

    [self constrainFontToButtonSize];

    if(color) {
        self.color = color;
    }
}

#pragma mark - Utilities
+ (NSString *)stringFromAwesomeIcon:(FAIcon)icon
{
    if(!awesomeStrings) {
        awesomeStrings = [NSArray arrayWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
    }
    
    return [awesomeStrings objectAtIndex:icon];
}

- (void)constrainFontToButtonSize
{
    NSString *iconString = self.titleLabel.text;
    CGSize size = [iconString sizeWithFont:self.titleLabel.font
                                  forWidth:self.bounds.size.width
                             lineBreakMode:NSLineBreakByCharWrapping];
    
    UIFont *font = self.titleLabel.font;

    while(size.width == 0 || CGRectGetMinY(self.titleLabel.frame) < 2 || CGRectGetMaxY(self.titleLabel.frame) > self.bounds.size.height - 2) {
        CGFloat fontSize = font.pointSize;
        fontSize -= 1;
        font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
        self.titleLabel.font = font;
        size = [iconString sizeWithFont:font
                               forWidth:self.bounds.size.width
                          lineBreakMode:NSLineBreakByCharWrapping];
    }
}

@end