//
//  GNTextFieldsManager.h
//  ey
//
//  Created by Jakub Knejzlik on 04/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GNTextFieldsManagerDelegate;

@interface GNTextFieldsManager : NSObject
@property (nonatomic,readonly) NSArray *textFields;
@property (nonatomic,assign) id<GNTextFieldsManagerDelegate> delegate;

-(id)initWithView:(UIView *)view;
-(id)initWithTextFields:(NSArray *)textFields;

-(void)selectFirstResponder;

@end


@protocol GNTextFieldsManagerDelegate <UITextFieldDelegate>

-(void)textFieldsManager:(GNTextFieldsManager *)manager lastTextFieldShouldReturn:(UITextField *)textField;

@end
