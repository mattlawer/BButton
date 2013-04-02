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
    
    BButtonType type = 0;
    
    for(int i = 0; i < 2; i++) {
        
        for(int j = 0; j < 7; j++) {
            BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(32.0f + (i * 144.0f), 20.0f + (j * 60.0f), 112.0f, 40.0f)];
            [btn setTitle:@"Button" forState:UIControlStateNormal];
            [btn setType:type];
            type++;
            [self.view addSubview:btn];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end