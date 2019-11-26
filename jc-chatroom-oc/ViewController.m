//
//  ViewController.m
//  jc-chatroom-oc
//
//  Created by JC on 2019/11/26.
//  Copyright © 2019 JC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    self.view.backgroundColor = UIColor.whiteColor;
    _messages = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, width, height - 200)];
    [_messages setText:@"chat messages will start here"];
    [self.view addSubview:_messages];
    _text = [[UITextField alloc] initWithFrame:CGRectMake(0, height - 100, width - 80, 50)];
    _text.placeholder = @"请输入发言内容";
    _text.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_text];
    _button = [[UIButton alloc] initWithFrame:CGRectMake(width - 80, height - 100, 80, 50)];
    _button.backgroundColor = UIColor.greenColor;
    [_button setTitle:@"确定" forState:UIControlStateNormal];
    [_button.layer setCornerRadius:10];
    [_button addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
    self.button.userInteractionEnabled = YES;
    [self.view addSubview:_button];
    [self connectSocketIO];
}

-(void)sendMessage{
    if(self.text.text.length == 0){
        NSLog(@"return");
        return;
    }
    NSLog(@"%@",self.text.text);
    [self chat:self.text.text];
    [self.text setText:@""];
}

-(void)connectSocketIO{
    NSURL *url = [[NSURL alloc] initWithString:@"http://47.56.100.123:3000"];
    _socket = [[SocketManager alloc] initWithSocketURL:url config:@{@"log":@NO,@"forcePolling":@YES,@"reconnectWail":@1}].defaultSocket;
    [_socket connect];
}

-(void)chat:(NSString *)message{
    NSLog(@"test:log");
    [_socket emit:@"chat" with:@[@{@"id":@"test",@"uid":@"test2"}]];
}

@end
