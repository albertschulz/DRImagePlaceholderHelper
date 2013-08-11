//
//  DRImagePlaceholderHelper.m
//  Dreams
//
//  Created by Albert on 11.08.13.
//  Copyright (c) 2013 Albert Schulz. All rights reserved.
//

#import "DRImagePlaceholderHelper.h"

@implementation DRImagePlaceholderHelper

static DRImagePlaceholderHelper *sharedObject = nil;

+ (DRImagePlaceholderHelper *)sharedInstance
{
    static dispatch_once_t _singletonPredicate;
    
    dispatch_once(&_singletonPredicate, ^{
        sharedObject = [[super allocWithZone:nil] init];
    });
    
    return sharedObject;
}

+ (id)allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

- (id)init
{
    self = [super init];
    if (self) {
        cache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (UIImage *)placerholderAvatarWithSize:(CGSize)size
{
    UIImage *cachedImage = [self imageCachedForSize:size isAvatar:YES fillColor:[UIColor lightGrayColor] text:nil];
    if (!cachedImage)
    {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
        if (UIGraphicsBeginImageContextWithOptions != NULL)
            UIGraphicsBeginImageContextWithOptions(size,NO,0);
        else
            // iOS is < 4.0
            UIGraphicsBeginImageContext(size);
        
        [[UIColor lightGrayColor] setFill];
        UIRectFill(rect);   // Fill it with your color
        
        CGSize squareSize = CGSizeMake(MIN(size.width, size.height), MIN(size.width, size.height));
        
        CGFloat xSquareDifference = size.width - squareSize.width;
        
        CGRect headRect = CGRectMake(0.4 / 2 * squareSize.width + xSquareDifference/2,
                                     0.4 / 2 * squareSize.height,
                                     0.6 * squareSize.width,
                                     0.6 * squareSize.height );
        
        CGFloat yBodyOffset = 0.4 / 2 * squareSize.height + 0.6 * squareSize.height / 2 * 1.7;
        
        CGRect bodyRect = CGRectMake(0.1 / 2 * squareSize.width + xSquareDifference/2,
                                     0.1 / 2 * squareSize.height + yBodyOffset,
                                     0.9 * squareSize.width,
                                     0.9 * squareSize.height );
        
        UIBezierPath* head = [UIBezierPath bezierPathWithOvalInRect:headRect];
        UIBezierPath* body = [UIBezierPath bezierPathWithOvalInRect:bodyRect];
        
        [[UIColor whiteColor] setFill];
        [head fill];
        [body fill];
        
        
        cachedImage = UIGraphicsGetImageFromCurrentImageContext();
        [self cacheImage:cachedImage isAvatar:YES fillColor:[UIColor lightGrayColor] text:nil];
        
        UIGraphicsEndImageContext();
    }
    
    return cachedImage;
}

- (UIImage *)placerholderImageWithSize:(CGSize)size
{
    UIImage *image = [self placerholderImageWithSize:size fillColor:[UIColor lightGrayColor]];
    return image;
}

- (UIImage *)placerholderImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor
{
    NSString *text = [NSString stringWithFormat:@"%i x %i", (int)size.width, (int)size.height];
    UIImage *image = [self placerholderImageWithSize:size text:text fillColor:fillColor];
    return image;
}

- (UIImage *)placerholderImageWithSize:(CGSize)size text:(NSString *)text
{
    UIImage *image = [self placerholderImageWithSize:size text:text fillColor:[UIColor lightGrayColor]];
    return image;
}

- (UIImage *)placerholderImageWithSize:(CGSize)size text:(NSString *)text fillColor:(UIColor *)fillColor
{
    UIImage *cachedImage = [self imageCachedForSize:size isAvatar:NO fillColor:fillColor text:text];
    if (!cachedImage)
    {
        // set the font type and size
        UIFont *font = [UIFont fontWithName:@"GillSans" size:MIN(size.width, size.height) / 5];
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        // check if UIGraphicsBeginImageContextWithOptions is available (iOS is 4.0+)
        if (UIGraphicsBeginImageContextWithOptions != NULL)
            UIGraphicsBeginImageContextWithOptions(size,NO,0);
        else
            // iOS is < 4.0
            UIGraphicsBeginImageContext(size);
        
        [fillColor setFill];
        UIRectFill(rect);   // Fill it with your color
        
        CGFloat fontColor[4] = {255,6,27,1};
        CGContextSetFillColor(UIGraphicsGetCurrentContext(), fontColor);
        CGContextSetTextDrawingMode(UIGraphicsGetCurrentContext(), kCGTextFill);
        
        CGFloat fontHeight = font.pointSize;
        CGFloat yOffset = (rect.size.height - fontHeight) / 2.0;
        CGRect textRect = CGRectMake(0, yOffset, rect.size.width, fontHeight);
        
        [text drawInRect: textRect withFont: font lineBreakMode:NSLineBreakByTruncatingMiddle
               alignment: NSTextAlignmentCenter];
        
        cachedImage = UIGraphicsGetImageFromCurrentImageContext();
        [self cacheImage:cachedImage isAvatar:NO fillColor:fillColor text:text];
        
        UIGraphicsEndImageContext();
    }
    
    return cachedImage;
}

- (UIImage *)imageCachedForSize:(CGSize)size isAvatar:(BOOL)isAvatar fillColor:(UIColor *)color text:(NSString *)text
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    NSString *colorAsString = [NSString stringWithFormat:@"%f,%f,%f,%f", components[0], components[1], components[2], components[3]];
    
    NSString *key = [NSString stringWithFormat:@"%0.1fx%0.1f|%i|%@|%@", size.width, size.height, isAvatar, colorAsString, text];
    UIImage *cachedImage = [cache objectForKey:key];
    return cachedImage;
}

- (void)cacheImage:(UIImage *)image isAvatar:(BOOL)isAvatar fillColor:(UIColor *)color text:(NSString *)text
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    NSString *colorAsString = [NSString stringWithFormat:@"%f,%f,%f,%f", components[0], components[1], components[2], components[3]];
    
    NSString *key = [NSString stringWithFormat:@"%0.1fx%0.1f|%i|%@|%@", image.size.width, image.size.height, isAvatar, colorAsString, text];
    [cache setObject:image forKey:key];
}

@end
