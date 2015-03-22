//
//  ViewController.m
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/17/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//  Fix two things: Configure Tab Bar and LogIn Check and Prevention

#import "ViewController.h"
#import <Parse/Parse.h>
#import "SongPushTabBarController.h"

@interface ViewController ()

@property (strong, nonatomic) NSMutableArray *credentials;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    // Set up installation and settings of push notifications
    PFQuery *pushQuery = [PFInstallation query];
    [pushQuery whereKey: @"deviceType" equalTo: @"ios"];
//    
//    [PFPush sendPushMessageToQueryInBackground: pushQuery withMessage: @"First Notification"];
    
    //Code to query or retrieve login information of account
    
//    PFQuery *queryForCredentials = [PFQuery queryWithClassName: @"Login Credentials"];
//    [queryForCredentials findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if (!error) {
//            self.credentials = [objects mutableCopy];
//            
//        }
//    }];
    
//    PFUser *user = [PFUser currentUser];
//    if (user.username != nil) {
//        [self performSegueWithIdentifier: @"login" sender: self];
//    }
    
    self.alertView1 = [[UIAlertView alloc] initWithTitle: @"Login Unsuccessful!" message: @"Make sure the information is correct!" delegate: self cancelButtonTitle: @"Try Again" otherButtonTitles: nil, nil];
    self.alertView2 = [[UIAlertView alloc] initWithTitle: @"Account Creation Successful!" message: @"You're ready to start using SongPush!" delegate: self cancelButtonTitle: @"Yes! Let's go!" otherButtonTitles: nil, nil];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *buttonTitle = [alertView buttonTitleAtIndex: buttonIndex];
    
    if ([buttonTitle isEqualToString: @"Try Again"]) {
        NSLog(@"Called successfully");
        //[self performSegueWithIdentifier: @"loginFail" sender: self];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)logInButtonPressed:(UIButton *)sender {
    [PFUser logInWithUsernameInBackground: self.usernameTextField.text password: self.passwordTextField.text block:^(PFUser *user, NSError *error) {
        if (user) {
            NSLog(@"LogIn Successful!");
            self.changeScenes = YES;
            //[self performSegueWithIdentifier: @"login" sender: nil];
        }
        else if (error) {
            self.changeScenes = NO;
            [self.alertView1 show];
            NSLog(@"LogIn Unsuccessful");
        }
    }];
}

- (IBAction)signUpButtonPressed:(UIButton *)sender {
    PFUser *newUser = [[PFUser alloc] init];
    newUser.username = self.usernameTextField.text;
    newUser.password = self.passwordTextField.text;
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Registration successful!");
            [self.alertView2 show];
            self.changeScenes = YES;
        }
        else {
            self.changeScenes = NO;
            NSLog(@"There was an error");
        }
    }];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    if (self.changeScenes == YES) {
        return NO;
    }
    else {
        return YES;
    }
}

//Figure out how to avoid transitioning scenes when there's a login failure
//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([sender isKindOfClass: [ViewController class]]) {
//        if ([segue.destinationViewController isKindOfClass: [SongPushTabBarController class]]) {
//            if (self.changeScenes == YES) {
//                [self performSegueWithIdentifier: @"login" sender: self];
//            }
//        }
//    }
//}

@end
