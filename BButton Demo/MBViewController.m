//
//  MBViewController.m
//  BButton Demo
//
//  Created by Mathieu Bolard on 31/07/12.
//  Copyright (c) 2012 Mathieu Bolard. All rights reserved.
//

#import "MBViewController.h"
#import "BButton.h"

@interface MBViewController ()
- (UIColor *)randomColor;
- (UIColor *)bootstrapColor;
- (IBAction)buttonClicked:(BButton *)button;
@end

@implementation MBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i=0; i<2; i++) {
        for (int j=0; j<5; j++) {
            BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(32.0+(i*144.0), 20.0+(j*60.0), 112.0, 40.0)];
            [btn setTitle:@"Login" forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.color = [self bootstrapColor];
            [self.view addSubview:btn];
            [btn release];
        }
    }
    
    demo1.color = [self bootstrapColor];
    demo2.color = [self bootstrapColor];
    demo3.color = [self bootstrapColor];
    demo4.color = [self bootstrapColor];
}

- (IBAction)buttonClicked:(BButton *)button {
    button.color = [self randomColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)randomColor {
    CGFloat r = arc4random()%255;
    CGFloat g = arc4random()%255;
    CGFloat b = arc4random()%255;
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}

- (UIColor *)bootstrapColor {
    int index = arc4random()%7;
    switch (index) {
        case 0: //Primary
            return [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
            break;
        case 1: //Warning
            return [UIColor colorWithRed:0.97f green:0.58f blue:0.02f alpha:1.00f];
            break;
        case 2: //Danger
            return [UIColor colorWithRed:0.74f green:0.21f blue:0.18f alpha:1.00f];
            break;
        case 3: //Success
            return [UIColor colorWithRed:0.32f green:0.64f blue:0.32f alpha:1.00f];
            break;
        case 4: //Info
            return [UIColor colorWithRed:0.18f green:0.59f blue:0.71f alpha:1.00f];
            break;
        case 5: //White
            return [UIColor colorWithRed:0.90f green:0.90f blue:0.90f alpha:1.00f];
            break;
        case 6: //Inverse
            return [UIColor colorWithRed:0.13f green:0.13f blue:0.13f alpha:1.00f];
            break;
    }
    return [UIColor colorWithRed:0.00f green:0.33f blue:0.80f alpha:1.00f];
}

@end
