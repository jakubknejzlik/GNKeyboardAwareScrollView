//
//  UIScrollView+GNKeyboardAware.m
//  Pods
//
//  Created by Jakub Knejzlik on 13/05/15.
//
//

#import "UIScrollView+GNKeyboardAware.h"

@implementation UIScrollView (GNKeyboardAware)

-(void)GN_attachKeyboardObservation{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GN_keyboardFrameChanged:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GN_keyboardFrameChanged:) name:UIKeyboardDidShowNotification object:nil];
}

-(void)GN_detachKeyboardObservation{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

-(void)GN_keyboardFrameChanged:(NSNotification *)notification{
    CGRect rect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    rect = [self.superview convertRect:rect fromView:[[[UIApplication sharedApplication] delegate] window]];
    [self GN_updateKeyboardContentInset:UIEdgeInsetsMake(0, 0, MAX(self.frame.size.height-rect.origin.y,0), 0)];
}
-(void)GN_updateKeyboardContentInset:(UIEdgeInsets)contentInset{
    [self setContentInset:contentInset];
    [self setScrollIndicatorInsets:contentInset];
}

@end
