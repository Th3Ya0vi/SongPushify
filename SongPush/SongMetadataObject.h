//
//  SongMetadataObject.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SongMetadataObject : NSObject

@property (strong, nonatomic) NSString *songArtistName;
@property (strong, nonatomic) NSString *songName;
@property (strong, nonatomic) NSString *songAlbumName;
@property (strong, nonatomic) NSString *songGenre;
@property (strong, nonatomic) NSDate *songReleaseDate;
@property (strong, nonatomic) NSDate *dateRecognized;

- (id) initWithMetadata: (NSDictionary *) metadata;

@end
