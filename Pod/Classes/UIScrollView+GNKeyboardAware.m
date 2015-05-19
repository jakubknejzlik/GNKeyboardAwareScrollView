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
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, MAX(CGRectGetMaxY(self.frame)-CGRectGetMinY(rect),0), 0);
    [self GN_updateContentInset:insets];
    [self GN_updateScrollIndicatorInset:insets];
}
-(void)GN_updateContentInset:(UIEdgeInsets)contentInset{
    [self setContentInset:contentInset];
}
-(void)GN_updateScrollIndicatorInset:(UIEdgeInsets)scrollIndicatorInset{
    [self setScrollIndicatorInsets:scrollIndicatorInset];
}

@end
