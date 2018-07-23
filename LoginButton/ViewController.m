//
//  ViewController.m
//  LoginButton
//
//  Created by MAKE on 2018/7/23.
//  Copyright © 2018年 MAKE. All rights reserved.
//

#import "ViewController.h"
#import "LoginEnableButton.h"
@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UITextField *textfield;

@property (nonatomic,strong)LoginEnableButton * loginButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.enabled = NO;
    [self configUI];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notify:) name:UITextFieldTextDidChangeNotification object:nil];

}

-(void)configUI{
    self.loginButton = [LoginEnableButton buttonWithType:UIButtonTypeCustom andNotifyTextFields:@[self.textfield]];
    self.loginButton.frame = CGRectMake(80, 200, 220, 50);
    self.loginButton.backgroundColor = [UIColor orangeColor];
    [self.loginButton setTitle:@"LoginEnableButton" forState:UIControlStateNormal];
    [self.loginButton setTitle:@"Disabled" forState:UIControlStateDisabled];
    [self.loginButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    self.loginButton.enabled = NO;
    [self.view addSubview:self.loginButton];
    [self.loginButton addTarget:self action:@selector(clickBTN:) forControlEvents:UIControlEventTouchUpInside];
    __weak typeof (self) weakSelf = self;
    
    
    self.loginButton.backCurrentTextfieldStatuts = ^(BOOL enable) {
        weakSelf.loginButton.enabled = enable;
    };
}


- (void)clickBTN:(id )sender{
    NSLog(@"clickBTN");
}

//- (void)notify:(NSNotification *)noti{
//    UITextField *textFiled = noti.object;
//    if (textFiled.text.length == 0) {
//        self.button.enabled = NO;
//    }else{
//        self.button.enabled = YES;
//    }
//}


//- (IBAction)clickButton:(id)sender {
//    NSLog(@"button CLICK");
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    NSLog(@"textFieldDidBeginEditing");
//}
//- (void)textFieldDidEndEditing:(UITextField *)textField{
//    NSLog(@".textFieldDidEndEditing.");
//}
//
//- (void)textFieldDidEndEditing:(UITextField *)textField reason:(UITextFieldDidEndEditingReason)reason{
//    NSLog(@"textFieldDidEndEditing");
//}
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//    if ( string.length == 0 ) { //删除
//        if (textField.text.length == 1) { //最后一个
//            self.button.enabled = NO;
//        }
//    }else{ //输入
//        self.button.enabled = YES;
//
//    }
//
//    return YES;
//}
@end

