//
//  UIImage+FontAwesome.h
//  M7Noites
//
//  Created by André Silva on 03/05/13.
//  Copyright (c) 2013 7Noites. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+FontAwesome.h"

@interface UIImage (FontAwesome)


+(UIImage*)imageWithAwesomeIcon:(FAIcon)icon
                           size:(CGFloat)size
                          color:(UIColor*)color
                    shadowColor:(UIColor*)shadowColor
                   shadowOffset:(CGSize)shadowOffset;

+(UIImage*)imageWithAwesomeIcon:(FAIcon)icon size:(CGFloat)size color:(UIColor*)color;

@end
