//
//  SongMetadataObject.m
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import "SongMetadataObject.h"
#import "SongMetadata.h"

@implementation SongMetadataObject

- (id) init {
    self = [self initWithMetadata: nil];
    return self;
}

- (id) initWithMetadata:(NSDictionary *)metadata {
    self = [super init];
    
    self.songArtistName = metadata[ARTIST_NAME];
    self.songName = metadata[SONG_NAME];
    self.songAlbumName = metadata[ALBUM_NAME];
    self.songGenre = metadata[SONG_GENRE];
    self.songReleaseDate = metadata[RELEASE_DATE];
    self.dateRecognized = metadata[DATE_LISTENED];
    
    return self;
}

@end
