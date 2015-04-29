//
//  GNKeyboardAwareScrollView.m
//  Pods
//
//  Created by Jakub Knejzlik on 29/04/15.
//
//

#import "GNKeyboardAwareScrollView.h"

@interface UIScrollView (KeyboardAwareScrollView)

-(void)gn_updateKeyboardContentInset:(UIEdgeInsets)contentInset;

-(void)attachKeyboardObservation;
-(void)detachKeyboardObservation;

@end



@interface GNKeyboardAwareScrollView ()
@property (nonatomic) UIEdgeInsets originalContentInsets;
@end

@implementation GNKeyboardAwareScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self gn_initializeKeyboardObservation];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self gn_initializeKeyboardObservation];
    }
    return self;
}

-(void)setContentInset:(UIEdgeInsets)contentInset{
    self.originalContentInsets = contentInset;
    [super setContentInset:contentInset];
}

-(void)dealloc{
    [self detachKeyboardObservation];
}

-(void)gn_initializeKeyboardObservation{
    [self attachKeyboardObservation];
}

@end



#pragma mark - KeyboardAwareScrollView categories
@implementation GNKeyboardAwareScrollView (KeyboardAwareScrollView)

-(void)gn_updateKeyboardContentInset:(UIEdgeInsets)contentInset{
    
    contentInset.top = MAX(contentInset.top,self.originalContentInsets.top);
    
    [super gn_updateKeyboardContentInset:contentInset];
    _estimatedContentInset = contentInset;
}

@end





#pragma mark - ScrollView categories
@implementation UIScrollView (KeyboardAwareScrollView)

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