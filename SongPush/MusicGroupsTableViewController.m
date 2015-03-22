//
//  MusicGroupsTableViewController.m
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import "MusicGroupsTableViewController.h"
#import "SongMetadata.h"
#import "SongCloudTableViewController.h"
#import <Parse/Parse.h>

@interface MusicGroupsTableViewController ()

//@property (strong, nonatomic) NSMutableArray *songsPushedArray;

@end

@implementation MusicGroupsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    PFQuery *query = [PFQuery queryWithClassName: @"SongData"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                self.songsInCloud = objects;
                [self.tableView reloadData];
            }
        }
        else {
            NSLog(@"Object Query Error");
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([sender isKindOfClass: [UITableViewCell class]]) {
        if ([segue.destinationViewController isKindOfClass: [SongCloudTableViewController class]]) {
            SongCloudTableViewController *nextViewController = segue.destinationViewController;
            NSIndexPath *path = [self.tableView indexPathForCell: sender];
            NSString *songCloudType = self.musicGroups[path.row];
            nextViewController.songCloudType = songCloudType;
            //NSLog(@"%@", songCloudType);
//            PFPush *newSongPushNotification = [[PFPush alloc] init];
//            [newSongPushNotification setChannel: @"Pop Cloud"];
//            [newSongPushNotification setMessage: @"A new song has been posted on the Pop Cloud!"];
//            [newSongPushNotification sendPushInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//                NSLog(@"Push sent!");
//            }];
            PFQuery *pushQuery = [PFInstallation query];
            [pushQuery whereKey: @"deviceType" equalTo: @"ios"];
            [PFPush sendPushMessageToQueryInBackground: pushQuery withMessage: [@"A new song has been posted on the " stringByAppendingString: songCloudType]];
        }
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 6;
    //return [self.songsInCloud count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Cell" forIndexPath:indexPath];
    
    self.musicGroups = [[NSMutableArray alloc] initWithObjects: @"Pop Cloud", @"Rap Cloud", @"Rock Cloud", @"Country Cloud", @"R&B Cloud", @"K-Pop Cloud", nil];
    
    cell.textLabel.text = [self.musicGroups objectAtIndex: indexPath.row];
    cell.detailTextLabel.text = @"";
    
//    PFObject *songInfo = [self.songsInCloud objectAtIndex: indexPath.row];
//    cell.textLabel.text = songInfo[@"artistName"];
//    cell.detailTextLabel.text = songInfo[@"songName"];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

@end
