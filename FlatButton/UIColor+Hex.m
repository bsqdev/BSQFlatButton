//
//  UIColor+Hex.m
//
//  Created by Brian Barnhart
//  Copyright (c) 2011 BSQ DEV LC. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor *)colorWithHex:(NSInteger)hexValue
{
	return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
						   green:((float)((hexValue & 0xFF00) >> 8))/255.0
							blue:((float)(hexValue & 0xFF))/255.0
						   alpha:1.0];
}

+ (UIColor *)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alpha
{
	return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
						   green:((float)((hexValue & 0xFF00) >> 8))/255.0
							blue:((float)(hexValue & 0xFF))/255.0
						   alpha:alpha];

}

@end
