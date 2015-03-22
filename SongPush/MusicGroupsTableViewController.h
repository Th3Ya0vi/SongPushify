//
//  MusicGroupsTableViewController.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SongMetadataObject.h"

@interface MusicGroupsTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *songsInCloud;
@property (strong, nonatomic) NSMutableArray *musicGroups;

@property (strong, nonatomic) SongMetadataObject *songMetadata;

@end
