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

+ (BButton *)awesomeButtonWithIcon:(FAIcon)icon {
    return [BButton awesomeButtonWithIcon:icon color:nil];
}

+ (BButton *)awesomeButtonWithIcon:(FAIcon)icon color:(UIColor *)color {
    return [BButton awesomeButtonWithIcon:icon color:color fontSize:14];
}

+ (BButton *)awesomeButtonWithIcon:(FAIcon)icon color:(UIColor *)color fontSize:(CGFloat)fontSize {

    BButton *awesomeButton = [[BButton alloc] init];
    
    if (color) {
        awesomeButton.color = color;
    }
    
    awesomeButton.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
    [awesomeButton setTitle:[BButton stringFromAwesomeIcon:icon] forState:UIControlStateNormal];
        
    return awesomeButton;
}

- (void)makeAwesomeWithIcon:(FAIcon)icon {
    [self makeAwesomeWithIcon:icon color:nil];
}

- (void)makeAwesomeWithIcon:(FAIcon)icon color:(UIColor *)color {
    [self makeAwesomeWithIcon:icon color:color fontSize:self.titleLabel.font.pointSize];
}

- (void)makeAwesomeWithIcon:(FAIcon)icon color:(UIColor *)color fontSize:(CGFloat)fontSize {
    self.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
    [self setTitle:[BButton stringFromAwesomeIcon:icon] forState:UIControlStateNormal];
    
    if (color) {
        self.color = color;
    }
}

+ (NSString *)stringFromAwesomeIcon:(FAIcon)icon {
    if (!awesomeStrings) {
        awesomeStrings = @[@"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @"", @""];
    }
    
    return [awesomeStrings objectAtIndex:icon];
}

@end


