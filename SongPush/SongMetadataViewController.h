//
//  SongMetadataViewController.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GracenoteMusicID/GNConfig.h>
#import <Parse/Parse.h>

#import "SongMetadataObject.h"

@interface SongMetadataViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *songArtistName;
@property (strong, nonatomic) IBOutlet UILabel *songName;
@property (strong, nonatomic) IBOutlet UILabel *songAlbumName;
@property (strong, nonatomic) IBOutlet UILabel *songGenre;
@property (strong, nonatomic) IBOutlet UILabel *songReleaseDate;
@property (strong, nonatomic) IBOutlet UILabel *dateRecognized;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

//@property (strong, nonatomic) SongMetadataObject *songMetadataObject;

@property (assign, nonatomic) UIBackgroundTaskIdentifier *fileUploadBackgroundTaskId;
@property (strong, nonatomic) PFFile *songMetadataParseObject;

@property (retain, nonatomic) PFObject *song;

- (IBAction)pushToCloudButtonPressed:(UIButton *)sender;
- (IBAction)pushToRapCloudButtonPressed:(UIButton *)sender;
- (IBAction)pushToCountryButtonPressed:(UIButton *)sender;
- (IBAction)pushToRockCloud:(UIButton *)sender;
- (IBAction)pushToRBCloud:(UIButton *)sender;
- (IBAction)pushToKPopCloud:(UIButton *)sender;
- (IBAction)pushToPersonalPlaylist:(UIButton *)sender;

@property (strong, nonatomic) GNConfig *config;

@end
