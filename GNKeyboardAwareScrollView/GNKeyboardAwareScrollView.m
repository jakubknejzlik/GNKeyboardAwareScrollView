//
//  RFKeyboardAwareScrollView.m
//  16
//
//  Created by Jakub Knejzlik on 10/08/14.
//  Copyright (c) 2014 Jakub Knejzlik. All rights reserved.
//

#import "GNKeyboardAwareScrollView.h"

@implementation GNKeyboardAwareScrollView

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


@end


@implementation GNKeyboardAwareScrollView (KeyboardAware)

-(void)attachKeyboardObservation{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardFrameChanged:) name:UIKeyboardDidShowNotification object:nil];
}

-(void)detachKeyboardObservation{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardFrameChanged:(NSNotification *)notification{
    CGRect rect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    rect = [self.superview convertRect:rect fromView:[[[UIApplication sharedApplication] delegate] window]];
    [self setContentInset:UIEdgeInsetsMake(0, 0, MAX(self.frame.size.height-rect.origin.y,0), 0)];
    [self setScrollIndicatorInsets:self.contentInset];
}

@end