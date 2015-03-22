//
//  FollowMusicGroupsTableViewController.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/22/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FollowMusicGroupsTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *musicGroups;

- (IBAction)followButtonPressed:(UIButton *)sender;

@end
