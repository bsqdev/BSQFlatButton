//
//  ViewController.m
//  FlatButton
//
//  Created by Brian Barnhart on 3/29/14.
//  Copyright (c) 2014 BSQ DEV LC. All rights reserved.
//

#import "ViewController.h"
#import "BSQFlatButton.h"
#import "UIColor+Hex.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet BSQFlatButton *ibFlatButton;
@property (nonatomic, weak) BSQFlatButton *flatButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	// Storyboard
	self.ibFlatButton.color = [UIColor colorWithHex:0xab8d1b];
	
	
	// Normal dynamic UIButton
	BSQFlatButton *flatButton = [[BSQFlatButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 120.0f, 32.0f)];
	flatButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14.0f];
    [flatButton addTarget:self action:@selector(didTapFlatButton:) forControlEvents:UIControlEventTouchUpInside];
    [flatButton setTitle:@"Flat Button" forState:UIControlStateNormal];
	[flatButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[flatButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
	self.flatButton = flatButton;
	[self.view addSubview:flatButton];

	// Pick color
	flatButton.color = [UIColor colorWithHex:0xaa1b1c];
	
	
	// Normay dynamic UIButton Auto Layout
	BSQFlatButton *button = [[BSQFlatButton alloc] initWithFrame:CGRectMake(0, 0, 120, 32)];
	button.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:14.0f];
    [button addTarget:self action:@selector(didTapFlatButton:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Disabled" forState:UIControlStateNormal];
	[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	button.enabled = NO;
	[self.view addSubview:button];
	
	// Pick color
	button.color = [UIColor colorWithHex:0xaa1b1c];
	
	
	// Layout
	button.translatesAutoresizingMaskIntoConstraints = NO;
	flatButton.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSDictionary *viewsDictionary =	NSDictionaryOfVariableBindings(button, flatButton, _ibFlatButton);
	
	
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_ibFlatButton]-40-[flatButton]"
																	  options:0
																	  metrics:nil
																		views:viewsDictionary]];
	
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[flatButton]-40-[button]"
																	  options:0
																	  metrics:nil
																		views:viewsDictionary]];
	
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[flatButton(120)]"
																	  options:0
																	  metrics:nil
																		views:viewsDictionary]];
	
	
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[button(120)]"
																	  options:0
																	  metrics:nil
																		views:viewsDictionary]];
	
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_ibFlatButton
														  attribute:NSLayoutAttributeLeft
														  relatedBy:NSLayoutRelationEqual
															 toItem:flatButton
														  attribute:NSLayoutAttributeLeft
														 multiplier:1.0
														   constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:flatButton
														  attribute:NSLayoutAttributeLeft
														  relatedBy:NSLayoutRelationEqual
															 toItem:button
														  attribute:NSLayoutAttributeLeft
														 multiplier:1.0
														   constant:0.0]];
}


#pragma mark - Button Events

- (void)didTapFlatButton:(id)sender
{
	
}

@end
