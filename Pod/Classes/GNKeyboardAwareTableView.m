//
//  GNKeyboardAwareTableView.m
//  Pods
//
//  Created by Jakub Knejzlik on 13/05/15.
//
//

#import "GNKeyboardAwareTableView.h"

#import "UIScrollView+GNKeyboardAware.h"


@interface GNKeyboardAwareTableView ()
@property (nonatomic) UIEdgeInsets originalContentInsets;
@property (nonatomic) UIEdgeInsets originalScrollIndicatorInsets;
@end

@implementation GNKeyboardAwareTableView

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
-(void)setScrollIndicatorInsets:(UIEdgeInsets)scrollIndicatorInsets{
    self.originalScrollIndicatorInsets = scrollIndicatorInsets;
    [super setScrollIndicatorInsets:scrollIndicatorInsets];
}

-(void)dealloc{
    [self GN_detachKeyboardObservation];
}

@end


#pragma mark - KeyboardAwareTableView categories
@implementation GNKeyboardAwareTableView (KeyboardAwareScrollView)

-(void)GN_updateContentInset:(UIEdgeInsets)contentInset{
    
    contentInset.top = MAX(contentInset.top,self.originalContentInsets.top);
    
    [super GN_updateContentInset:contentInset];
    _estimatedContentInset = contentInset;
}

@end