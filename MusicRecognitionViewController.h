//
//  MusicRecognitionViewController.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GracenoteMusicID/GNConfig.h>

@interface MusicRecognitionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *artistLabel;
@property (strong, nonatomic) IBOutlet UILabel *songLabel;
@property (strong, nonatomic) IBOutlet UILabel *listeningText;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@property (retain, nonatomic) GNConfig *config;

- (IBAction)musicRecognitionButton:(UIButton *)sender;

@end
