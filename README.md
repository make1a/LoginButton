# LoginButton

登陆状态的按钮继承UIButton

![image](https://github.com/make1a/LoginButton/blob/master/loginbutton.gif)


接口：

  传入要观察的textfield,可传入多个。
```
- (instancetype)initAndNotifyTextFields:(NSArray <UITextField *> *)textFields;

+ (instancetype)buttonWithType:(UIButtonType)buttonType andNotifyTextFields:(NSArray <UITextField *> *)textFields;

```

使用： 调用`backCurrentTextfieldStatuts`可以接收当前textfield的状态

```
    self.loginButton = [LoginEnableButton buttonWithType:UIButtonTypeCustom andNotifyTextFields:@[self.textfield]];
    self.loginButton.backCurrentTextfieldStatuts = ^(BOOL enable) {
        weakSelf.loginButton.enabled = enable;
    };
```
