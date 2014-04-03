//
//  BSQFlatButton.m
//  BSQ DEV LLC
//
//  Created by Brian Barnhart on 1/3/14.
//	Copyright (c) 2014 BSQ DEV LC. All rights reserved.
//

#import "BSQFlatButton.h"

@interface BSQFlatButton ()

@property (nonatomic) BOOL isObserving;
@property (nonatomic) BOOL hasSetup;
@property (nonatomic, strong) CALayer *baseLayer;
@property (nonatomic, strong) CALayer *highlightLayer;

@end

@implementation BSQFlatButton

- (void)dealloc
{
	[self removeObserver:self forKeyPath:@"highlighted"];
	[self removeObserver:self forKeyPath:@"disabled"];
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (!self) {
		return self;
	}
	
	if (frame.size.width > 0 && frame.size.height > 0) {
		[self setup];
	}
	
	return self;
}

- (void)setFrame:(CGRect)frame
{
	[super setFrame:frame];
	[self setup];
}

-(void)awakeFromNib;
{
	[self setup];
}

- (void)setup
{
    self.baseLayer = [[CAGradientLayer alloc] init];
    self.baseLayer.bounds = self.bounds;
	
    self.baseLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self.layer insertSublayer:self.baseLayer atIndex:0];
	
	self.highlightLayer = [[CAGradientLayer alloc] init];
	self.highlightLayer.bounds = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    self.highlightLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    [self.layer insertSublayer:self.highlightLayer above:self.baseLayer];

	self.layer.cornerRadius = 4.0f;
	self.clipsToBounds = YES;
	self.layer.masksToBounds = YES;
	self.adjustsImageWhenHighlighted = YES;
	
	if (!_isObserving) {
		_isObserving = YES;
		[self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:NULL];
		[self addObserver:self forKeyPath:@"disabled" options:NSKeyValueObservingOptionNew context:NULL];
	}
}

- (void)setEnabled:(BOOL)enabled
{
	[super setEnabled:enabled];
	[self setNeedsDisplay];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect;
{
	[CATransaction begin];
    [CATransaction setDisableActions:YES];
	
	self.highlightLayer.hidden = YES;
	
	if (self.highlighted) {
		UIColor *color = [UIColor colorWithRed:0 green:0 blue:0 alpha:.2];
		self.highlightLayer.hidden = NO;
		[self.highlightLayer setBackgroundColor:color.CGColor];
	}
	else if (!self.enabled) {
		UIColor *color = [UIColor colorWithRed:0 green:0 blue:0 alpha:.4];
		self.highlightLayer.hidden = NO;
		[self.highlightLayer setBackgroundColor:color.CGColor];
	}
	
	[self.baseLayer setBackgroundColor:self.color.CGColor];
	
	[CATransaction commit];
}

@end
