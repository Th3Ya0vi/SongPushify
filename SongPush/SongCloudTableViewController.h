//
//  SongCloudTableViewController.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/22/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MusicGroupsTableViewController.h"

@interface SongCloudTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *songsInCloud;
@property (strong, nonatomic) NSString *songCloudType;

@end
