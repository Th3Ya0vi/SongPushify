//
//  PersonalMonetizedPlaylistTableViewController.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/22/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalMonetizedPlaylistTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *songsInPlaylist;

- (IBAction)sellPlaylistBarButtonPressed:(UIBarButtonItem *)sender;

@end
