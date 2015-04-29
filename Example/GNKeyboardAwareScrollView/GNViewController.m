//
//  GNViewController.m
//  GNKeyboardAwareScrollView
//
//  Created by Jakub Knejzlik on 04/29/2015.
//  Copyright (c) 2014 Jakub Knejzlik. All rights reserved.
//

#import "GNViewController.h"

#import <GNKeyboardAwareScrollView.h>

@interface GNViewController ()
@property (strong, nonatomic) IBOutlet GNKeyboardAwareScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;

@end

@implementation GNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
