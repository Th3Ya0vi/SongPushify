//
//  ViewController.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/17/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIAlertViewDelegate>

@property (nonatomic) BOOL changeScenes;

@property (strong, nonatomic) UIAlertView *alertView1;
@property (strong, nonatomic) UIAlertView *alertView2;
@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)logInButtonPressed:(UIButton *)sender;
- (IBAction)signUpButtonPressed:(UIButton *)sender;

@end

