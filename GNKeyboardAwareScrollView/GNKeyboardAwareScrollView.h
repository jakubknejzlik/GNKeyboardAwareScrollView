//
//  RFKeyboardAwareScrollView.h
//  16
//
//  Created by Jakub Knejzlik on 10/08/14.
//  Copyright (c) 2014 Jakub Knejzlik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GNKeyboardAwareScrollView : UIScrollView

@end


@interface UIScrollView (KeyboardAware)

-(void)attachKeyboardObservation;
-(void)detachKeyboardObservation;

@end