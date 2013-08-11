//
//  ViewController.m
//  DRImagePlacerholerHelperExample
//
//  Created by Albert on 11.08.13.
//  Copyright (c) 2013 Albert Schulz. All rights reserved.
//

#import "ViewController.h"
#import "DRImagePlaceholderHelper.h"

@interface ViewController () //

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [imageView1 fillWithPlaceholderImage];
    [imageView2 fillWithPlaceholderImageAndFillColor:[UIColor colorWithRed:0.227f green:0.447f blue:0.698f alpha:1.00f]];
    
    imageView3.image = [[DRImagePlaceholderHelper sharedInstance] placerholderAvatarWithSize:imageView3.frame.size];
    
    [imageView4 fillWithPlaceholderImageAndText:@"Hey!" fillColor:[UIColor colorWithRed:0.861f green:0.791f blue:0.467f alpha:1.00f]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
