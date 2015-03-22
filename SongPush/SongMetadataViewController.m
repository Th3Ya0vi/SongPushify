//
//  SongMetadataViewController.m
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import "SongMetadataViewController.h"
#import "FPResponse.h"
#import <GracenoteMusicID/GNConfig.h>
#import <GracenoteMusicID/GNOperations.h>
#import "SongMetadata.h"
#import "SongMetadataObject.h"
#import "MusicGroupsTableViewController.h"
#import <Parse/Parse.h>

@implementation SongMetadataViewController

- (BOOL) shouldUploadSongMetadataToParse {
    NSLog(@"The song's artist is %@", self.songArtistName.text);
    NSData *artistNameData = [self.songArtistName.text dataUsingEncoding: NSUTF8StringEncoding];
    self.songMetadataParseObject = [PFFile fileWithData: artistNameData];
    
    [self.songMetadataParseObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Metadata saved successfully!");
        }
    }];
    
    if (![self.songArtistName.text isEqualToString: @"No Match!"]) {
        self.song = [[PFObject alloc] initWithClassName: @"SongData"];
        self.song[@"artistName"] = self.songArtistName.text;
        self.song[@"songName"] = self.songName.text;
        self.song[@"albumName"] = self.songAlbumName.text;
        self.song[@"typeCloud"] = @"";
        [self.song saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                NSLog(@"Object creation successful!");
            }
        }];
    }
    
    [self.activityIndicator setHidden: YES];
    
    return YES;
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    self.config = [GNConfig init: @"11985920-4640D54E093BF2ED929F99001882D441"];
    
    [self.activityIndicator setHidden: NO];
    [self.activityIndicator startAnimating];
    
    id response2 = [[FPResponse alloc] initWithLabel: self.songArtistName : self.songName : self.songAlbumName : self.songGenre : self.songReleaseDate : self.dateRecognized];
    [GNOperations recognizeMIDStreamFromMic: response2 config: self.config];
    
//    NSDictionary *metadata = @{SONG_NAME : self.songName, ARTIST_NAME : self.songArtistName, ALBUM_NAME : self.songAlbumName, SONG_GENRE : self.songGenre, RELEASE_DATE : self.songReleaseDate, DATE_LISTENED : self.dateRecognized};
//    
//    //Package information into SongMetadataObject
//    self.songMetadataObject = [[SongMetadataObject alloc] initWithMetadata: metadata];
    
    [self performSelector: @selector(shouldUploadSongMetadataToParse) withObject: self afterDelay: 21];
    
    
    //self.songMetadataParseObject =    `
    
    if (![self.songArtistName.text isEqualToString: @"Listening..."]) {
        [self.activityIndicator setHidden: YES];
    }
    else if ([self.songArtistName.text isEqualToString: @"No Match!"]) {
        [self.activityIndicator setHidden: YES];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass: [SongMetadataViewController class]]) {
        if ([segue.destinationViewController isKindOfClass: [MusicGroupsTableViewController class]]) {
            //MusicGroupsTableViewController *nextViewController = segue.destinationViewController;
            //nextViewController.songMetadata = self.songMetadataObject;
        }
    }
}

- (IBAction)pushToCloudButtonPressed:(UIButton *)sender {
//    if (!self.songMetadataParseObject) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Couldn't push song to cloud!" message:nil delegate: nil cancelButtonTitle: @"Ok" otherButtonTitles: nil, nil];
//        [alert show];
//    }
    self.song[@"typeCloud"] = @"Pop Cloud";
    [self.song saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Now should go to typeCloud!");
        }
    }];
    //NSLog(@"Should go to typeCloud!");
}

- (IBAction)pushToRapCloudButtonPressed:(UIButton *)sender {
    self.song[@"typeCloud"] = @"Rap Cloud";
    [self.song saveInBackground];
    [self performSegueWithIdentifier: @"pushSongToCloud" sender: self];
}

- (IBAction)pushToCountryButtonPressed:(UIButton *)sender {
    self.song[@"typeCloud"] = @"Country Cloud";
    [self.song saveInBackground];
    [self performSegueWithIdentifier: @"pushSongToCloud" sender: self];
}

- (IBAction)pushToRockCloud:(UIButton *)sender {
    self.song[@"typeCloud"] = @"Rock Cloud";
    [self.song saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            NSLog(@"Just making sure!");
        }
    }];
    [self performSegueWithIdentifier: @"pushSongToCloud" sender: self];
}

- (IBAction)pushToRBCloud:(UIButton *)sender {
    self.song[@"typeCloud"] = @"R&B Cloud";
    [self.song saveInBackground];
    [self performSegueWithIdentifier: @"pushSongToCloud" sender: self];
}

- (IBAction)pushToKPopCloud:(UIButton *)sender {
    self.song[@"typeCloud"] = @"K-Pop Cloud";
    [self.song saveInBackground];
    [self performSegueWithIdentifier: @"pushSongToCloud" sender: self];
}

- (IBAction)pushToPersonalPlaylist:(UIButton *)sender {
    self.song[@"typeCloud"] = @"Personal Playlist";
    [self.song saveInBackground];
    //[self performSegueWithIdentifier: @"pushSongToPlaylist" sender: self];
}

@end
