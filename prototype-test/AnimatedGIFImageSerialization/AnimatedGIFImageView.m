//
//  AnimatedGIFImageView.m
//  Animated GIF Example
//
//  Created by James Tang on 27/3/14.
//  Copyright (c) 2014 Mattt Thompson. All rights reserved.
//

#import "AnimatedGIFImageView.h"
#import <objc/runtime.h>

@interface UIImage (ResourceName)

@property (nonatomic, copy, readonly) NSString *animated_gif_resourceName;

@end


@implementation AnimatedGIFImageView

- (void)awakeFromNib {
    self.image = [UIImage imageNamed:self.image.animated_gif_resourceName];
}

@end


#pragma mark -


@implementation UIImage (ResourceName)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {

            //Exchange XIB loading implementation
            Method m1 = class_getInstanceMethod(NSClassFromString(@"UIImageNibPlaceholder"), @selector(initWithCoder:));
            Method m2 = class_getInstanceMethod(self, @selector(animated_gif_initWithCoder:));
            method_exchangeImplementations(m1, m2);
        }
    });
}

- (id)animated_gif_initWithCoder:(NSCoder *)aDecoder {
	NSString *resourceName = [aDecoder decodeObjectForKey:@"UIResourceName"];
    UIImage *image = [self animated_gif_initWithCoder:aDecoder];
    image.animated_gif_resourceName = resourceName;
    return image;
}

- (void)setAnimated_gif_resourceName:(NSString *)animated_gif_resourceName {
    objc_setAssociatedObject(self, @selector(animated_gif_resourceName), animated_gif_resourceName, OBJC_ASSOCIATION_COPY);
}

- (NSString *)animated_gif_resourceName {
    return objc_getAssociatedObject(self, @selector(animated_gif_resourceName));
}

@end
