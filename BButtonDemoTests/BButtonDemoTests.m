//
//  BButtonDemoTests.m
//  BButtonDemoTests
//
//  Created by Jesse Squires on 11/12/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BButton.h"

@interface BButtonDemoTests : XCTestCase

@end


@implementation BButtonDemoTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testButtonInitMethods
{
    CGRect frame = CGRectMake(0.0f, 0.0f, 140.0f, 44.0f);
    
    BButton *btn = [[BButton alloc] initWithFrame:frame type:BButtonTypeDefault style:BButtonStyleBootstrapV2];
    XCTAssertNotNil(btn, @"Button should not be nil");
    
    
    
    btn = nil;
    btn = [[BButton alloc] initWithFrame:frame
                                    type:BButtonTypeDefault
                                   style:BButtonStyleBootstrapV2
                                    icon:FAIconAdjust
                                fontSize:14.0f];
    XCTAssertNotNil(btn, @"Button should not be nil");
    
    
    
    btn = nil;
    btn = [[BButton alloc] initWithFrame:frame color:[UIColor redColor] style:BButtonStyleBootstrapV3];
    XCTAssertNotNil(btn, @"Button should not be nil");
    
    
    
    btn = nil;
    btn = [[BButton alloc] initWithFrame:frame
                                   color:[UIColor blackColor]
                                   style:BButtonStyleBootstrapV3
                                    icon:FAIconZoomOut
                                fontSize:16.0f];
    XCTAssertNotNil(btn, @"Button should not be nil");
    
    
    
    btn = nil;
    btn = [BButton awesomeButtonWithOnlyIcon:FAIconZoomIn color:[UIColor blueColor] style:BButtonStyleBootstrapV2];
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.titleLabel.text length] == 1, @"Button text should only include FAIcon");
}

- (void)testButtonClassInitMethods
{
    BButton *btn = [BButton awesomeButtonWithOnlyIcon:FAIconUserMd type:BButtonTypeDefault style:BButtonStyleBootstrapV3];
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.titleLabel.text length] == 1, @"Button text should only include FAIcon");
    
    
    
    btn = nil;
    btn = [BButton awesomeButtonWithOnlyIcon:FAIconZoomIn color:[UIColor blueColor] style:BButtonStyleBootstrapV2];
    XCTAssertNotNil(btn, @"Button should not be nil");
    XCTAssert([btn.titleLabel.text length] == 1, @"Button text should only include FAIcon");
}

- (void)testFontAwesome
{
    NSArray *allIcons = [NSString fa_allFontAwesomeStrings];
    XCTAssertNotNil(allIcons, @"Array should not be nil");
    XCTAssert([allIcons count] != 0, @"Array should not be empty");
    
    NSString *icon = [NSString fa_stringFromFontAwesomeStrings:allIcons
                                                       forIcon:FAIconWarningSign];
    XCTAssertNotNil(icon, @"Icon should not be nil");
    XCTAssert([allIcons containsObject:icon], @"Icon should be contained in icon list");
    XCTAssertEqual([allIcons indexOfObject:icon], FAIconWarningSign, @"Array index should equal FAIcon ENUM");
    
    
    
    NSString *btnTitle = @"Button Title";
    FAIcon i = FAIconVolumeDown;
    BButton *btn = [[BButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 50.0f)
                                             type:BButtonTypeDefault
                                            style:BButtonStyleBootstrapV3];
    
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    XCTAssertEqual([btn.titleLabel.text length], [btnTitle length], @"Button title lengths should be equal");
    
    [btn addAwesomeIcon:i beforeTitle:NO];
    XCTAssertEqual([btn.titleLabel.text length], [btnTitle length] + 2, @"Button title length should be 2 characters longer after adding icon");
    
    icon = [NSString fa_stringFromFontAwesomeStrings:allIcons forIcon:i];
    NSString *btnIcon = [btn.titleLabel.text substringFromIndex:[btn.titleLabel.text length] - 1];
    XCTAssert([btnIcon isEqualToString:icon], @"Last character in button title should equal FA icon");
    
    
    
    i = FAIconTerminal;
    [btn addAwesomeIcon:i beforeTitle:YES];
    XCTAssertEqual([btn.titleLabel.text length], [btnTitle length] + 4, @"Button title length should be 4 characters longer after adding 2 icons");
    
    icon = [NSString fa_stringFromFontAwesomeStrings:allIcons forIcon:i];
    btnIcon = [btn.titleLabel.text substringToIndex:1];
    XCTAssert([btnIcon isEqualToString:icon], @"First character in button title should equal FA icon");
}

@end
