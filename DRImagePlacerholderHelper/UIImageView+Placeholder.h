//
//  UIImageView+Placeholer.h
//  DRImagePlacerholerHelperExample
//
//  Created by Albert on 11.08.13.
//  Copyright (c) 2013 Albert Schulz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Placeholder)

- (void)fillWithPlaceholerImage;
- (void)fillWithPlaceholerImageAndFillColor:(UIColor *)fillColor;
- (void)fillWithPlaceholerImageAndText:(NSString *)text;
- (void)fillWithPlaceholerImageAndText:(NSString *)text fillColor:(UIColor *)fillColor;
- (void)fillWithAvatarPlaceholder;

@end
