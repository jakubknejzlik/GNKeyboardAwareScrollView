//
//  GNTextFieldsManager.m
//  ey
//
//  Created by Jakub Knejzlik on 04/09/14.
//  Copyright (c) 2014 Funtasty Digital s.r.o. All rights reserved.
//

#import "GNTextFieldsManager.h"


@interface GNTextFieldsManager () <UITextFieldDelegate>
@end

@implementation GNTextFieldsManager

-(id)initWithView:(UIView *)view{
    return [self initWithTextFields:[GNTextFieldsManager textFieldsFromView:view]];
}

-(id)initWithTextFields:(NSArray *)textFields{
    self = [super init];
    if (self) {
        _textFields = textFields;
        [self initializeTextFields];
    }
    return self;
}


-(void)initializeTextFields{
    UIReturnKeyType lastTextFieldReturnKeyType = [[self.textFields lastObject] returnKeyType];
    for (UITextField *tf in self.textFields) {
        tf.returnKeyType = UIReturnKeyNext;
        tf.delegate = self;
    }
    
    [[self.textFields lastObject] setReturnKeyType:lastTextFieldReturnKeyType];
}

-(void)selectFirstResponder{
    [[self.textFields firstObject] becomeFirstResponder];
}

-(id)forwardingTargetForSelector:(SEL)aSelector{
    return self.delegate;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == [self.textFields lastObject]) {
        [self.delegate textFieldsManager:self lastTextFieldShouldReturn:textField];
    }else{
        NSUInteger index = [self.textFields indexOfObject:textField];
        if(index != NSNotFound){
            index++;
            if(index < [self.textFields count]){
                [[self.textFields objectAtIndex:index] becomeFirstResponder];
            }
        }
    }
    return YES;
}



#pragma mark - UIView TextField scan
+(NSArray *)textFieldsFromView:(UIView *)view{
    NSMutableArray *array = [NSMutableArray array];
    [self fillArray:array withTextFieldsFromView:view];
    return [array sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"tag" ascending:YES]]];
}
+(void)fillArray:(NSMutableArray *)array withTextFieldsFromView:(UIView *)view{
    for (UIView *subview in view.subviews) {
        if ([subview isKindOfClass:[UITextField class]] && subview.tag > 0) {
            [array addObject:subview];
        }
        [self fillArray:array withTextFieldsFromView:subview];
    }
}

@end

