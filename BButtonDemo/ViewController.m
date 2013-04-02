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

@end



@implementation ViewController

#pragma mark - View lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i=0; i<2; i++) {
        for (int j=0; j<5; j++) {
            BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(32.0+(i*144.0), 20.0+(j*60.0), 112.0, 40.0)];
            [btn setTitle:@"Button" forState:UIControlStateNormal];
            [self.view addSubview:btn];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end