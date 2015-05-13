//
//  UIScrollView+GNKeyboardAware.h
//  Pods
//
//  Created by Jakub Knejzlik on 13/05/15.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (GNKeyboardAware)

-(void)GN_updateKeyboardContentInset:(UIEdgeInsets)contentInset;

-(void)GN_attachKeyboardObservation;
-(void)GN_detachKeyboardObservation;

@end
