//
//  ViewController.m
//  BButtonDemo
//
//  Created by Jesse Squires on 4/2/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//
//  http://hexedbits.com
//

#import "ViewController.h"

@interface ViewController ()

- (NSString *)titleForType:(BButtonType)type;

@end



@implementation ViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    uncomment to set corner radius for all buttons
//    
//    [[BButton appearance] setButtonCornerRadius:[NSNumber numberWithFloat:0.0f]];
    
    BButtonType type = 0;
    
    for(int i = 0; i < 2; i++) {
        
        for(int j = 0; j < 7; j++) {
            CGRect frame = CGRectMake(32.0f + (i * 144.0f), 20.0f + (j * 60.0f), 112.0f, 40.0f);
            BButton *btn = [[BButton alloc] initWithFrame:frame type:type style:BButtonStyleBootstrapV3];
            [btn setTitle:[self titleForType:type] forState:UIControlStateNormal];
            
            if(type == BButtonTypeFacebook)
                [btn addAwesomeIcon:FAIconFacebook beforeTitle:YES];
            else if(type == BButtonTypeTwitter)
                [btn addAwesomeIcon:FAIconTwitter beforeTitle:NO];
            
            type++;
            if(type > BButtonTypeGray) {
                btn = [BButton awesomeButtonWithOnlyIcon:arc4random() % 209
                                                    type:(type % 2) ? BButtonTypeInverse : BButtonTypeDefault
                                                   style:BButtonStyleBootstrapV3];
                
                btn.frame = CGRectMake(frame.origin.x, frame.origin.y, btn.frame.size.width, btn.frame.size.width);
            }
            
            [btn addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            
//            uncomment to show buttons as disabled
//            
//            btn.shouldShowDisabled = YES;
//            btn.enabled = NO;
            
            [self.view addSubview:btn];
        }
    }
}

#pragma mark - Utilities

- (void)buttonPressed:(UIButton *)sender
{
    NSLog(@"Good jorb, you pressed a button: %@", sender.titleLabel.text);
}

- (NSString *)titleForType:(BButtonType)type
{
    switch (type) {
        case BButtonTypePrimary:
            return @"Primary";
        
        case BButtonTypeInfo:
            return @"Info";
            
        case BButtonTypeSuccess:
            return @"Success";
            
        case BButtonTypeWarning:
            return @"Warning";
            
        case BButtonTypeDanger:
            return @"Danger";
            
        case BButtonTypeInverse:
            return @"Inverse";
            
        case BButtonTypeTwitter:
            return @"Twitter";
        
        case BButtonTypeFacebook:
            return @"Facebook";
            
        case BButtonTypePurple:
            return @"Purple";
            
        case BButtonTypeGray:
            return @"Gray";
            
        case BButtonTypeDefault:
        default:
            return @"Default";
    }
}

@end