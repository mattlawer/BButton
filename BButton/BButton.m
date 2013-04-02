//
//  BButton.m
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//
//  https://github.com/mattlawer/BButton
//

#import "BButton.h"

@interface BButton ()

- (void)setGradientEnabled:(BOOL)enabled;
- (UIColor *)lightenColor:(UIColor *)oldColor value:(float)value;
- (UIColor *)darkenColor:(UIColor *)oldColor value:(float)value;
- (BOOL)isLightColor:(UIColor *)color;

@end



@implementation BButton

@synthesize color;
@synthesize gradient;
@synthesize type;

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame type:(BButtonType)pType
{
    self = [super initWithFrame:frame];
    if(self) {
        [self setup];
        [self setType:pType];
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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self) {
        [self setup];
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

- (void)setup
{
    self.backgroundColor = [UIColor clearColor];
    [self setType:BButtonTypeDefault];
    self.titleLabel.shadowOffset = CGSizeMake(0.0f, -1.0f);
    self.titleLabel.font = [UIFont boldSystemFontOfSize:17.0f];
    self.shouldShowDisabled = NO;
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
    
    if(self.shouldShowDisabled)
        [self setGradientEnabled:enabled];
    
    [self setNeedsDisplay];
}

#pragma mark - Setters
- (void)setColor:(UIColor *)newColor
{
    color = newColor;
    
    if([self isLightColor:color]) {
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleShadowColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6f] forState:UIControlStateNormal];
        
        if(self.shouldShowDisabled)
            [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateDisabled];
    }
    else {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleShadowColor:[[UIColor blackColor] colorWithAlphaComponent:0.6f] forState:UIControlStateNormal];
        
        if(self.shouldShowDisabled)
            [self setTitleColor:[UIColor lightTextColor] forState:UIControlStateDisabled];
    }
    
    if(self.shouldShowDisabled)
        [self setGradientEnabled:self.enabled];
    else
        [self setGradientEnabled:YES];
    
    [self setNeedsDisplay];
}

- (void)setType:(BButtonType)newType
{
    UIColor *newColor = nil;
    
    switch (newType) {
        case BButtonTypePrimary:
            newColor = [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
            break;
        case BButtonTypeInfo:
            newColor = [UIColor colorWithRed:0.18f green:0.59f blue:0.71f alpha:1.00f];
            break;
        case BButtonTypeSuccess:
            newColor = [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
            break;
        case BButtonTypeWarning:
            newColor = [UIColor colorWithRed:0.97f green:0.58f blue:0.02f alpha:1.00f];
            break;
        case BButtonTypeDanger:
            newColor = [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1.00f];
            break;
        case BButtonTypeInverse:
            newColor = [UIColor colorWithRed:0.13f green:0.13f blue:0.13f alpha:1.00f];
            break;
        case BSButtonTypeTwitter:
            newColor = [UIColor colorWithRed:0.25f green:0.60f blue:1.00f alpha:1.00f];
            break;
        case BSButtonTypeFacebook:
            newColor = [UIColor colorWithRed:0.23f green:0.35f blue:0.60f alpha:1.00f];
            break;
        case BSButtonTypePurple:
            newColor = [UIColor colorWithRed:0.45f green:0.30f blue:0.75f alpha:1.00f];
            break;
        case BSButtonTypeGray:
            newColor = [UIColor colorWithRed:0.60f green:0.60f blue:0.60f alpha:1.00f];
            break;
        case BButtonTypeDefault:
        default:
            newColor = [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.00f];
            break;
    }
    
    [self setColor:newColor];
}

#pragma mark - Drawing
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor* border = [self darkenColor:self.color value:0.06f];
    
    // Shadow Declarations
    UIColor* shadow = [self lightenColor:border value:0.50f];
    CGSize shadowOffset = CGSizeMake(0.0f, 1.0f);
    CGFloat shadowBlurRadius = 2.0f;
    
    // Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0.5f, 0.5, rect.size.width-1.0f, rect.size.height-1.0f)
                                                                    cornerRadius:6.0f];
    
    CGContextSaveGState(context);
    
    [roundedRectanglePath addClip];
    
    CGContextDrawLinearGradient(context,
                                self.gradient,
                                CGPointMake(0.0f, self.highlighted ? rect.size.height-0.5f : 0.5f),
                                CGPointMake(0.0f, self.highlighted ? 0.5f : rect.size.height-0.5f), 0.0f);
    
    CGContextRestoreGState(context);
    
    if(!self.highlighted) {
        // Rounded Rectangle Inner Shadow
        CGRect roundedRectangleBorderRect = CGRectInset([roundedRectanglePath bounds], -shadowBlurRadius, -shadowBlurRadius);
        roundedRectangleBorderRect = CGRectOffset(roundedRectangleBorderRect, -shadowOffset.width, -shadowOffset.height);
        roundedRectangleBorderRect = CGRectInset(CGRectUnion(roundedRectangleBorderRect, [roundedRectanglePath bounds]), -1.0f, -1.0f);
        
        UIBezierPath* roundedRectangleNegativePath = [UIBezierPath bezierPathWithRect: roundedRectangleBorderRect];
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

- (void)setGradientEnabled:(BOOL)enabled
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    UIColor* topColor = [self lightenColor:self.color value:0.12f];
    
    if(!enabled) {
        topColor = [self darkenColor:self.color value:0.12f];
    }
    
    NSArray* newGradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)self.color.CGColor, nil];
    CGFloat newGradientLocations[] = {0.0f, 1.0f};
    
    self.gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)newGradientColors, newGradientLocations);
    CGColorSpaceRelease(colorSpace);
}

- (UIColor *)lightenColor:(UIColor *)oldColor value:(float)value
{
    int totalComponents = CGColorGetNumberOfComponents(oldColor.CGColor);
    bool isGreyscale = totalComponents == 2 ? YES : NO;
    
    CGFloat* oldComponents = (CGFloat *)CGColorGetComponents(oldColor.CGColor);
    CGFloat newComponents[4];
    
    if(isGreyscale) {
        newComponents[0] = oldComponents[0]+value > 1.0 ? 1.0 : oldComponents[0]+value;
        newComponents[1] = oldComponents[0]+value > 1.0 ? 1.0 : oldComponents[0]+value;
        newComponents[2] = oldComponents[0]+value > 1.0 ? 1.0 : oldComponents[0]+value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0]+value > 1.0 ? 1.0 : oldComponents[0]+value;
        newComponents[1] = oldComponents[1]+value > 1.0 ? 1.0 : oldComponents[1]+value;
        newComponents[2] = oldComponents[2]+value > 1.0 ? 1.0 : oldComponents[2]+value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

- (UIColor *)darkenColor:(UIColor *)oldColor value:(float)value
{
    int totalComponents = CGColorGetNumberOfComponents(oldColor.CGColor);
    bool isGreyscale = totalComponents == 2 ? YES : NO;
    
    CGFloat* oldComponents = (CGFloat *)CGColorGetComponents(oldColor.CGColor);
    CGFloat newComponents[4];
    
    if (isGreyscale) {
        newComponents[0] = oldComponents[0]-value < 0.0 ? 0.0 : oldComponents[0]-value;
        newComponents[1] = oldComponents[0]-value < 0.0 ? 0.0 : oldComponents[0]-value;
        newComponents[2] = oldComponents[0]-value < 0.0 ? 0.0 : oldComponents[0]-value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0]-value < 0.0 ? 0.0 : oldComponents[0]-value;
        newComponents[1] = oldComponents[1]-value < 0.0 ? 0.0 : oldComponents[1]-value;
        newComponents[2] = oldComponents[2]-value < 0.0 ? 0.0 : oldComponents[2]-value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
	CGColorSpaceRelease(colorSpace);
    
	UIColor *retColor = [UIColor colorWithCGColor:newColor];
	CGColorRelease(newColor);
    
    return retColor;
}

- (BOOL)isLightColor:(UIColor *)color
{
    int totalComponents = CGColorGetNumberOfComponents(self.color.CGColor);
    bool isGreyscale = totalComponents == 2 ? YES : NO;
    
    CGFloat* components = (CGFloat *)CGColorGetComponents(self.color.CGColor);
    CGFloat sum;
    
    if (isGreyscale) {
        sum = components[0];
    }
    else {
        sum = (components[0]+components[1]+components[2]) / 3.0f;
    }
    
    return (sum > 0.8f);
}

@end