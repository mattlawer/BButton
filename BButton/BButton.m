//
//  BButton.m
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//
//
//  BButton is licensed under the MIT license
//  http://opensource.org/licenses/MIT
//
//
//  -----------------------------------------
//  Edited and refactored by Jesse Squires on 2 April, 2013.
//
//  http://github.com/jessesquires/BButton
//
//  http://hexedbits.com
//

#import "BButton.h"
#import <CoreGraphics/CoreGraphics.h>

@interface BButton ()

@property (assign, nonatomic) BButtonStyle style;

- (void)setup;

+ (UIColor *)colorForButtonType:(BButtonType)type style:(BButtonStyle)style;
+ (UIColor *)colorForV2StyleButtonWithType:(BButtonType)type;
+ (UIColor *)colorForV3StyleButtonWithType:(BButtonType)type;

@end



@implementation BButton

@synthesize color;
@synthesize shouldShowDisabled;

#pragma mark - Initialization
- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    self.titleLabel.shadowOffset = CGSizeMake(0.0f, -1.0f);
    self.shouldShowDisabled = NO;
    self.style = BButtonStyleBootstrapV3;
    [self setType:BButtonTypeDefault];
}

- (id)initWithFrame:(CGRect)frame type:(BButtonType)type style:(BButtonStyle)aStyle
{
    return [self initWithFrame:frame
                         color:[BButton colorForButtonType:type style:aStyle]
                         style:aStyle];
}

- (id)initWithFrame:(CGRect)frame
               type:(BButtonType)type
              style:(BButtonStyle)aStyle
               icon:(FAIcon)icon
           fontSize:(CGFloat)fontSize
{
    return [self initWithFrame:frame
                         color:[BButton colorForButtonType:type style:aStyle]
                         style:aStyle
                          icon:icon
                      fontSize:fontSize];
}

- (id)initWithFrame:(CGRect)frame color:(UIColor *)aColor style:(BButtonStyle)aStyle
{
    self = [self initWithFrame:frame];
    if(self) {
        self.color = aColor;
        self.style = aStyle;
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
              color:(UIColor *)aColor
              style:(BButtonStyle)aStyle
               icon:(FAIcon)icon
           fontSize:(CGFloat)fontSize
{
    self = [self initWithFrame:frame color:aColor style:aStyle];
    if(self) {
        self.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:fontSize];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitle:[NSString stringFromAwesomeIcon:icon] forState:UIControlStateNormal];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self setup];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self setup];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if(self) {
        [self setup];
    }
    return self;
}

#pragma mark - Class initialization
+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon
                                  type:(BButtonType)type
                                 style:(BButtonStyle)aStyle
{
    return [BButton awesomeButtonWithOnlyIcon:icon
                                        color:[BButton colorForButtonType:type style:aStyle]
                                        style:aStyle];
}

+ (BButton *)awesomeButtonWithOnlyIcon:(FAIcon)icon
                                 color:(UIColor *)color
                                 style:(BButtonStyle)aStyle
{
    return [[BButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40.0f, 40.0f)
                                    color:color
                                    style:aStyle
                                     icon:icon
                                 fontSize:20.0f];
}

#pragma mark - Parent overrides
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self setNeedsDisplay];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    [self setNeedsDisplay];
}

#pragma mark - Setters
- (void)setColor:(UIColor *)newColor
{
    color = newColor;
    
    if([newColor isLightColor]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleShadowColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6f] forState:UIControlStateNormal];
        
        if(self.shouldShowDisabled)
            [self setTitleColor:[UIColor colorWithWhite:0.4f alpha:0.5f] forState:UIControlStateDisabled];
    }
    else {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.6f] forState:UIControlStateNormal];
        
        if(self.shouldShowDisabled)
            [self setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateDisabled];
    }
    
    [self setNeedsDisplay];
}

- (void)setShouldShowDisabled:(BOOL)show
{
    shouldShowDisabled = show;
    
    if(show) {
        if([self.color isLightColor])
            [self setTitleColor:[UIColor colorWithWhite:0.4f alpha:0.5f] forState:UIControlStateDisabled];
        else
            [self setTitleColor:[UIColor colorWithWhite:1.0f alpha:0.5f] forState:UIControlStateDisabled];
    }
    else {
        if([self.color isLightColor])
            [self setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
        else
            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
    }
}

#pragma mark - BButton
- (void)setType:(BButtonType)type
{
    self.color = [BButton colorForButtonType:type style:self.style];
}

- (void)addAwesomeIcon:(FAIcon)icon beforeTitle:(BOOL)before
{
    NSString *iconString = [NSString stringFromAwesomeIcon:icon];
    self.titleLabel.font = [UIFont fontWithName:@"FontAwesome"
                                           size:self.titleLabel.font.pointSize];
    
    NSString *title = [NSString stringWithFormat:@"%@", iconString];
    
    if(self.titleLabel.text && ![self.titleLabel.text isEmpty]) {
        if(before)
            title = [title stringByAppendingFormat:@" %@", self.titleLabel.text];
        else
            title = [NSString stringWithFormat:@"%@  %@", self.titleLabel.text, iconString];
    }
    
    [self setTitle:title forState:UIControlStateNormal];
}

+ (UIColor *)colorForButtonType:(BButtonType)type style:(BButtonStyle)style
{
    switch (style) {
        case BButtonStyleBootstrapV2:
            return [BButton colorForV2StyleButtonWithType:type];
        case BButtonStyleBootstrapV3:
        default:
            return [BButton colorForV3StyleButtonWithType:type];
    }
}

+ (UIColor *)colorForV2StyleButtonWithType:(BButtonType)type
{
    switch (type) {
        case BButtonTypePrimary:
            return [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
            
        case BButtonTypeInfo:
            return [UIColor colorWithRed:0.18f green:0.59f blue:0.71f alpha:1.00f];
            
        case BButtonTypeSuccess:
            return [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
            
        case BButtonTypeWarning:
            return [UIColor colorWithRed:0.97f green:0.58f blue:0.02f alpha:1.00f];
            
        case BButtonTypeDanger:
            return [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1.00f];
            
        case BButtonTypeInverse:
            return [UIColor colorWithRed:0.13f green:0.13f blue:0.13f alpha:1.00f];
            
        case BButtonTypeTwitter:
            return [UIColor colorWithRed:0.25f green:0.60f blue:1.00f alpha:1.00f];
            
        case BButtonTypeFacebook:
            return [UIColor colorWithRed:0.23f green:0.35f blue:0.60f alpha:1.00f];
            
        case BButtonTypePurple:
            return [UIColor colorWithRed:0.45f green:0.30f blue:0.75f alpha:1.00f];
            
        case BButtonTypeGray:
            return [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f];
            
        case BButtonTypeDefault:
        default:
            return [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.00f];
    }
}

+ (UIColor *)colorForV3StyleButtonWithType:(BButtonType)type
{
    return nil; // TODO:
}

#pragma mark - Drawing
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *border = [self.color darkenColorWithValue:0.06f];
    
    // Shadow Declarations
    UIColor *shadow = [self.color lightenColorWithValue:0.50f];
    CGSize shadowOffset = CGSizeMake(0.0f, 1.0f);
    CGFloat shadowBlurRadius = 2.0f;
    
    // Rounded Rectangle Drawing
    UIBezierPath *roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0.5f, 0.5f, rect.size.width-1.0f, rect.size.height-1.0f)
                                                                    cornerRadius:6.0f];
    
    CGContextSaveGState(context);
    
    [roundedRectanglePath addClip];
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor *topColor = (self.shouldShowDisabled && !self.enabled) ? [self.color darkenColorWithValue:0.12f] : [self.color lightenColorWithValue:0.12f];
    
    NSArray *newGradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)self.color.CGColor, nil];
    CGFloat newGradientLocations[] = {0.0f, 1.0f};
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)newGradientColors, newGradientLocations);
    
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                CGPointMake(0.0f, self.highlighted ? rect.size.height - 0.5f : 0.5f),
                                CGPointMake(0.0f, self.highlighted ? 0.5f : rect.size.height - 0.5f), 0.0f);
    
    CGGradientRelease(gradient);
    
    CGContextRestoreGState(context);
    
    if(!self.highlighted) {
        // Rounded Rectangle Inner Shadow
        CGRect roundedRectangleBorderRect = CGRectInset([roundedRectanglePath bounds], -shadowBlurRadius, -shadowBlurRadius);
        roundedRectangleBorderRect = CGRectOffset(roundedRectangleBorderRect, -shadowOffset.width, -shadowOffset.height);
        roundedRectangleBorderRect = CGRectInset(CGRectUnion(roundedRectangleBorderRect, [roundedRectanglePath bounds]), -1.0f, -1.0f);
        
        UIBezierPath *roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect: roundedRectangleBorderRect];
        [roundedRectangleNegativePath appendPath: roundedRectanglePath];
        roundedRectangleNegativePath.usesEvenOddFillRule = YES;
        
        CGContextSaveGState(context);
        {
            CGFloat xOffset = shadowOffset.width + round(roundedRectangleBorderRect.size.width);
            CGFloat yOffset = shadowOffset.height;
            CGContextSetShadowWithColor(context,
                                        CGSizeMake(xOffset + copysign(0.1f, xOffset), yOffset + copysign(0.1f, yOffset)),
                                        shadowBlurRadius,
                                        shadow.CGColor);
            
            [roundedRectanglePath addClip];
            CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(roundedRectangleBorderRect.size.width), 0.0f);
            [roundedRectangleNegativePath applyTransform: transform];
            [[UIColor grayColor] setFill];
            [roundedRectangleNegativePath fill];
        }
        CGContextRestoreGState(context);
    }
    
    [border setStroke];
    roundedRectanglePath.lineWidth = 1.0f;
    [roundedRectanglePath stroke];
}

@end