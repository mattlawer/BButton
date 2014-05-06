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

#import <XCTest/XCTest.h>
#import "BButton.h"

@interface BButtonDemoTests : XCTestCase

@end


@implementation BButtonDemoTests

- (void)testButtonInitMethods
{
    CGRect frame = CGRectMake(0.0f, 0.0f, 140.0f, 44.0f);
    
    BButton *btn = [[BButton alloc] initWithFrame:frame type:BButtonTypeDefault style:BButtonStyleBootstrapV2];
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.color isEqual:[UIColor bb_defaultColorV2]], @"Colors should be equal");
    
    btn = nil;
    btn = [[BButton alloc] initWithFrame:frame
                                    type:BButtonTypeWarning
                                   style:BButtonStyleBootstrapV3
                                    icon:FAAdjust
                                fontSize:14.0f];
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.color isEqual:[UIColor bb_warningColorV3]], @"Colors should be equal");
    
    
    
    btn = nil;
    btn = [[BButton alloc] initWithFrame:frame color:[UIColor redColor] style:BButtonStyleBootstrapV3];
    XCTAssertNotNil(btn, @"Button should not be nil");
    
    
    
    btn = nil;
    btn = [[BButton alloc] initWithFrame:frame
                                   color:[UIColor blackColor]
                                   style:BButtonStyleBootstrapV3
                                    icon:FASearchMinus
                                fontSize:16.0f];
    XCTAssertNotNil(btn, @"Button should not be nil");
    
    
    
    btn = nil;
    btn = [BButton awesomeButtonWithOnlyIcon:FASearchPlus color:[UIColor blueColor] style:BButtonStyleBootstrapV2];
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.titleLabel.text length] == 1, @"Button text should only include FAIcon");
}

- (void)testButtonClassInitMethods
{
    BButton *btn = [BButton awesomeButtonWithOnlyIcon:FAUserMd type:BButtonTypeSuccess style:BButtonStyleBootstrapV3];
    XCTAssert([btn.color isEqual:[UIColor bb_successColorV3]], @"Colors should be equal");
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.titleLabel.text length] == 1, @"Button text should only include FAIcon");
    
    
    
    btn = nil;
    btn = [BButton awesomeButtonWithOnlyIcon:FASearchPlus color:[UIColor blueColor] style:BButtonStyleBootstrapV2];
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.titleLabel.text length] == 1, @"Button text should only include FAIcon");
}

- (void)testFontAwesome
{
    NSString *icon = [NSString fa_stringFromFontAwesomeForIcon:FAWarning];
    XCTAssertNotNil(icon, @"Icon should not be nil");
    
    NSString *btnTitle = @"Button Title";
    FAIcon i = FAVolumeDown;
    BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 50.0f)
                                             type:BButtonTypeInverse
                                            style:BButtonStyleBootstrapV2];
    XCTAssert([btn.color isEqual:[UIColor bb_inverseColorV2]], @"Colors should be equal");
    
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    XCTAssertEqual([btn.titleLabel.text length], [btnTitle length], @"Button title lengths should be equal");
    
    [btn addAwesomeIcon:i beforeTitle:NO];
    XCTAssertEqual([btn.titleLabel.text length], [btnTitle length] + 2, @"Button title length should be 2 characters longer after adding icon");
    
    icon = [NSString fa_stringFromFontAwesomeForIcon:i];
    NSString *btnIcon = [btn.titleLabel.text substringFromIndex:[btn.titleLabel.text length] - 1];
    XCTAssert([btnIcon isEqualToString:icon], @"Last character in button title should equal FA icon");
    
    i = FATerminal;
    [btn addAwesomeIcon:i beforeTitle:YES];
    XCTAssertEqual([btn.titleLabel.text length], [btnTitle length] + 4, @"Button title length should be 4 characters longer after adding 2 icons");
    
    icon = [NSString fa_stringFromFontAwesomeForIcon:i];
    btnIcon = [btn.titleLabel.text substringToIndex:1];
    XCTAssert([btnIcon isEqualToString:icon], @"First character in button title should equal FA icon");
}

@end
