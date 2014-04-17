//
//  BButtonDemo
//
//  Created by Jesse Squires on 11/12/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "TWBSDemoViewController.h"

@implementation TWBSDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    uncomment to set corner radius for all buttons
    //
    //    [[BButton appearance] setButtonCornerRadius:@50.0f];
    
    BButtonType type = 0;
    
    // This is to get a random icon from the Enum. Since we cannot get a random enum in Objective-C, we need to create an array of them to get a random value from a subset of the whole enum.
    NSUInteger arrayOfIcons[] = {FASortAlphaAsc, FASortAlphaDesc, FASortAmountAsc, FASortAmountDesc, FASortNumericAsc, FASortNumericDesc, FAThumbsUp, FAThumbsDown, FAYoutubeSquare, FAYoutube, FAXing, FAXingSquare, FAYoutubePlay, FADropbox, FAStackOverflow, FAInstagram, FAFlickr, FAAdn, FABitbucket, FABitbucketSquare, FATumblr, FATumblrSquare, FALongArrowDown, FALongArrowUp, FALongArrowLeft, FALongArrowRight, FAApple, FAWindows, FAAndroid, FALinux, FADribbble, FASkype, FAFoursquare, FATrello, FAFemale, FAMale, FAGittip, FASunO, FAMoonO, FAArchive, FABug, FAVk, FAWeibo, FARenren, FAPagelines, FAStackExchange, FAArrowCircleORight, FAArrowCircleOLeft, FAToggleLeft, FACaretSquareOLeft, FADotCircleO, FAWheelchair, FAVimeoSquare, FATurkishLira, FATry, FAPlusSquareO};
    int sizeOfIconsArray = sizeof(arrayOfIcons)/sizeof(arrayOfIcons[0]);
    
    for(int i = 0; i < 2; i++) {
        
        for(int j = 0; j < 7; j++) {
            CGRect frame = CGRectMake(32.0f + (i * 144.0f),
                                      40.0f + (j * 60.0f),
                                      112.0f,
                                      44.0f);
            
            BButton *btn = [[BButton alloc] initWithFrame:frame type:type style:BButtonStyleBootstrapV3];
            [btn setTitle:[self titleForType:type] forState:UIControlStateNormal];
            
            if(type == BButtonTypeFacebook)
                [btn addAwesomeIcon:FAIconFacebook beforeTitle:YES];
            else if(type == BButtonTypeTwitter)
                [btn addAwesomeIcon:FAIconTwitter beforeTitle:NO];
            
            type++;
            if(type > BButtonTypeGray) {
                btn = [BButton awesomeButtonWithOnlyIcon:arrayOfIcons[arc4random_uniform(sizeOfIconsArray)]
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
