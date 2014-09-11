//
//  RFKeyboardAwareScrollView.m
//  16
//
//  Created by Jakub Knejzlik on 10/08/14.
//  Copyright (c) 2014 Jakub Knejzlik. All rights reserved.
//

#import "GNKeyboardAwareScrollView.h"

@interface UIScrollView (KeyboardAwarePrivate)
-(void)gn_updateKeyboardContentInset:(UIEdgeInsets)contentInset;
@end


@implementation GNKeyboardAwareScrollView
@synthesize estimatedContentInset = _estimatedContentInset;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)dealloc{
    [self detachKeyboardObservation];
}

-(void)initialize{
    [self attachKeyboardObservation];
}
-(void)gn_updateKeyboardContentInset:(UIEdgeInsets)contentInset{
    [super gn_updateKeyboardContentInset:contentInset];
    _estimatedContentInset = contentInset;
}


@end


@implementation UIScrollView (KeyboardAware)

-(void)attachKeyboardObservation{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gn_keyboardFrameChanged:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gn_keyboardFrameChanged:) name:UIKeyboardDidShowNotification object:nil];
}

-(void)detachKeyboardObservation{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)gn_keyboardFrameChanged:(NSNotification *)notification{
    CGRect rect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    rect = [self.superview convertRect:rect fromView:[[[UIApplication sharedApplication] delegate] window]];
    [self gn_updateKeyboardContentInset:UIEdgeInsetsMake(0, 0, MAX(self.frame.size.height-rect.origin.y,0), 0)];
}
-(void)gn_updateKeyboardContentInset:(UIEdgeInsets)contentInset{
    [self setContentInset:contentInset];
    [self setScrollIndicatorInsets:contentInset];
}

@end