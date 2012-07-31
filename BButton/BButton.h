//
//  BButton.h
//  BButton Demo
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BButton : UIButton {
    UIColor *_color;
    CGGradientRef _gradient;
}

@property (nonatomic, assign) UIColor *color;

@end
