//
//  DRImagePlaceholderHelper.h
//  Dreams
//
//  Created by Albert on 11.08.13.
//  Copyright (c) 2013 Albert Schulz. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "UIImageView+Placeholder.h"

@interface DRImagePlaceholderHelper : NSObject
{
    NSMutableDictionary *cache;
}

+ (id)sharedInstance;

- (UIImage *)placerholderImageWithSize:(CGSize)size;
- (UIImage *)placerholderImageWithSize:(CGSize)size text:(NSString *)text;
- (UIImage *)placerholderImageWithSize:(CGSize)size text:(NSString *)text fillColor:(UIColor *)fillColor;
- (UIImage *)placerholderImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor;
- (UIImage *)placerholderAvatarWithSize:(CGSize)size;

@end
