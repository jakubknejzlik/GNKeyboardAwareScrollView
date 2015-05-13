//
//  GNKeyboardAwareScrollView.m
//  Pods
//
//  Created by Jakub Knejzlik on 29/04/15.
//
//

#import "GNKeyboardAwareScrollView.h"

#import "UIScrollView+GNKeyboardAware.h"


@interface GNKeyboardAwareScrollView ()
@property (nonatomic) UIEdgeInsets originalContentInsets;
@end

@implementation GNKeyboardAwareScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self GN_attachKeyboardObservation];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self GN_attachKeyboardObservation];
    }
    return self;
}

-(void)setContentInset:(UIEdgeInsets)contentInset{
    self.originalContentInsets = contentInset;
    [super setContentInset:contentInset];
}

-(void)dealloc{
    [self GN_detachKeyboardObservation];
}

@end


#pragma mark - KeyboardAwareScrollView categories
@implementation GNKeyboardAwareScrollView (KeyboardAwareScrollView)

-(void)GN_updateKeyboardContentInset:(UIEdgeInsets)contentInset{
    
    contentInset.top = MAX(contentInset.top,self.originalContentInsets.top);
    
    [super GN_updateKeyboardContentInset:contentInset];
    _estimatedContentInset = contentInset;
}

@end

