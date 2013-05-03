//
//  UIImage+FontAwesome.m
//  M7Noites
//
//  Created by André Silva on 03/05/13.
//  Copyright (c) 2013 7Noites. All rights reserved.
//

#import "UIImage+FontAwesome.h"
#import <QuartzCore/QuartzCore.h>
#import "UILabel+FontAwesome.h"

@implementation UIImage (FontAwesome)

+(UIImage*)imageWithAwesomeIcon:(FAIcon)icon
                           size:(CGFloat)size
                          color:(UIColor*)color
                    shadowColor:(UIColor*)shadowColor
                   shadowOffset:(CGSize)shadowOffset {
        
    // use a label to draw text
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0.0, 0.0, size, size)];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    label.shadowOffset = shadowOffset;
    label.shadowColor = shadowColor;
    label.adjustsFontSizeToFitWidth = YES;
    
    [label addAwesomeIcon:icon fontSize:size];
    
    UIGraphicsBeginImageContextWithOptions(label.bounds.size, NO, [[UIScreen mainScreen] scale]);

    [label.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+(UIImage*)imageWithAwesomeIcon:(FAIcon)icon size:(CGFloat)size color:(UIColor*)color {
        
    return [UIImage imageWithAwesomeIcon:icon size:size color:color shadowColor:[UIColor clearColor] shadowOffset:CGSizeMake(0.0, 0.0)];
}

@end
