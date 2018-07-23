//
//  LoginEnableButton.m
//  LoginButton
//
//  Created by MAKE on 2018/7/23.
//  Copyright © 2018年 MAKE. All rights reserved.
//

#import "LoginEnableButton.h"
@interface LoginEnableButton()<UITextFieldDelegate>
@property (nonatomic,strong)NSArray * textfieldArray;
@property (nonatomic,strong)NSMutableArray * boolArrays;
@end
@implementation LoginEnableButton


#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"

- (instancetype)initAndNotifyTextFields:(NSArray <UITextField *> *)textFields;
{
    self = [super init];
    if (self)
    {
        self.textfieldArray = textFields;
        self.boolArrays = @[].mutableCopy;
        for (id obj in textFields) { [self.boolArrays addObject:@NO]; }
        [self addNotification];
    }
    return self;
}

+ (instancetype)buttonWithType:(UIButtonType)buttonType andNotifyTextFields:(NSArray <UITextField *> *)textFields{
   LoginEnableButton * button = [super buttonWithType:buttonType];
    if (button) {
        button.textfieldArray = textFields;
        button.boolArrays = @[].mutableCopy;
        for (id obj in textFields) { [button.boolArrays addObject:@NO]; }
        [button addNotification];
    }
    return button;
}

#pragma clang diagnostic pop


- (void)addNotification{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notifyTextfield:) name:UITextFieldTextDidChangeNotification object:nil];

}
- (void)notifyTextfield:(NSNotification *)noti{
    UITextField *textfield = noti.object;
    if ([self.textfieldArray containsObject:textfield]) {
        NSInteger index = [self.textfieldArray indexOfObject:textfield];
        if (textfield.text.length == 0) {
            [self.boolArrays replaceObjectAtIndex:index withObject:@NO];
        }else{
            [self.boolArrays replaceObjectAtIndex:index withObject:@YES];
        }
    
        if (self.backCurrentTextfieldStatuts) {
            if ([self.boolArrays containsObject:@NO]) {
                self.backCurrentTextfieldStatuts(NO);
            }else{
                self.backCurrentTextfieldStatuts(YES);
            }
        }
    }
}
#pragma mark - get and set
- (void)masLayoutSubview
{
    
}

@end
