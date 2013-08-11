//
//  UIImageView+Placeholer.m
//  DRImagePlacerholerHelperExample
//
//  Created by Albert on 11.08.13.
//  Copyright (c) 2013 Albert Schulz. All rights reserved.
//

#import "UIImageView+Placeholder.h"
#import "DRImagePlaceholderHelper.h"

@implementation UIImageView (Placeholder)

- (void)fillWithPlaceholderImage
{
    self.image = [[DRImagePlaceholderHelper sharedInstance] placerholderImageWithSize:self.frame.size];
}

- (void)fillWithPlaceholderImageAndFillColor:(UIColor *)fillColor
{
    self.image = [[DRImagePlaceholderHelper sharedInstance] placerholderImageWithSize:self.frame.size fillColor:fillColor];
}

- (void)fillWithPlaceholderImageAndText:(NSString *)text
{
    self.image = [[DRImagePlaceholderHelper sharedInstance] placerholderImageWithSize:self.frame.size text:text];
}

- (void)fillWithPlaceholderImageAndText:(NSString *)text fillColor:(UIColor *)fillColor
{
    self.image = [[DRImagePlaceholderHelper sharedInstance] placerholderImageWithSize:self.frame.size text:text fillColor:fillColor];
}

- (void)fillWithAvatarPlaceholder
{
    self.image = [[DRImagePlaceholderHelper sharedInstance] placerholderAvatarWithSize:self.frame.size];
}

@end
