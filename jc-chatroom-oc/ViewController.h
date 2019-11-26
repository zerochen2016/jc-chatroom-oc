//
//  ViewController.h
//  jc-chatroom-oc
//
//  Created by JC on 2019/11/26.
//  Copyright © 2019 JC. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SocketIO;

@interface ViewController : UIViewController

@property(nonatomic, strong)UIButton *button;
@property(nonatomic, strong)UITextField *text;
@property(nonatomic, strong)UITextView *messages;
@property(nonatomic, strong)SocketIOClient *socket;

-(void)connectSocketIO;
-(void)chat:(NSString *)message;

@end

