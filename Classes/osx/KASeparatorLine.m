//
//  KASeparatorLine.m
//
//  Created by James Chen on 2014/02/15.
//  Copyright (c) 2014 ashchan.com. All rights reserved.
//

#import "KASeparatorLine.h"

@implementation KASeparatorLine

- (void)drawRect:(NSRect)dirtyRect {
    static dispatch_once_t onceToken;
    static NSGradient *darkGradient, *lightGradient;
    dispatch_once(&onceToken, ^{
        darkGradient = gradientWithTargetColor([NSColor colorWithSRGBRed:.8 green:.8 blue:.8 alpha:1]);
        lightGradient = gradientWithTargetColor([NSColor colorWithSRGBRed:1 green:1 blue:1 alpha:0.55]);
    });

    NSRect rect = [self separatorRect];
    [lightGradient drawInRect:rect angle:0];
    rect.origin.y += 1;
    [darkGradient drawInRect:rect angle:0];
}

- (NSRect)separatorRect {
    return (NSRect){
        .origin = NSMakePoint(0, 0),
        .size   = NSMakeSize(self.bounds.size.width, 1)
    };
}

static NSGradient *gradientWithTargetColor(NSColor *targetColor) {
    NSArray *colors = @[[targetColor colorWithAlphaComponent:0], targetColor, targetColor, [targetColor colorWithAlphaComponent:0]];
    const CGFloat locations[4] = { 0, 0.35, 0.65, 1.0 };
    return [[NSGradient alloc] initWithColors:colors atLocations:locations colorSpace:[NSColorSpace sRGBColorSpace]];
}

@end
