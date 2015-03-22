//
//  MusicRecognitionViewController.m
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import "MusicRecognitionViewController.h"
#import "FPResponse.h"
#import <GracenoteMusicID/GNConfig.h>
#import <GracenoteMusicID/GNOperations.h>

@implementation MusicRecognitionViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.config = [GNConfig init: @"11985920-4640D54E093BF2ED929F99001882D441"];
    [self.activityIndicator setHidden: YES];
}

- (IBAction)musicRecognitionButton:(UIButton *)sender {
    [self.listeningText setText: @"Listening..."];
    [self.activityIndicator setHidden: NO];
    [self.activityIndicator startAnimating];
    id response = [[FPResponse alloc] initWithLabel: self.artistLabel : self.songLabel];
    [GNOperations recognizeMIDStreamFromMic: response config: self.config];
//    if (![self.artistLabel.text isEqualToString: @""]) {
//        [self.activityIndicator stopAnimating];
//        [self.activityIndicator setHidden: YES];
//        NSLog(@"Yes!");
//    }
}

@end
