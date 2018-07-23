//
//  LoginEnableButton.h
//  LoginButton
//
//  Created by MAKE on 2018/7/23.
//  Copyright © 2018年 MAKE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginEnableButton : UIButton


@property (nonatomic,copy) void (^backCurrentTextfieldStatuts)(BOOL enable);



- (instancetype)initAndNotifyTextFields:(NSArray <UITextField *> *)textFields;

+ (instancetype)buttonWithType:(UIButtonType)buttonType andNotifyTextFields:(NSArray <UITextField *> *)textFields;
@end
