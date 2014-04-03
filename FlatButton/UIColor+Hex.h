//
//  UIColor+Hex.h
//
//  Created by Brian Barnhart
//  Copyright (c) 2011 BSQ DEV LC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(NSInteger)hexValue;
+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha;

@end
