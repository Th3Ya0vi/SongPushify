//
//  FPResponse.m
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import "FPResponse.h"
#import <GracenoteMusicID/GNSearchResultReady.h>
#import <GracenoteMusicID/GNSearchResponse.h>
#import <GracenoteMusicID/GNSearchResult.h>

@implementation FPResponse

@synthesize artistLabel;
@synthesize songLabel;
@synthesize songGenreLabel;
@synthesize albumLabel;
@synthesize releaseDateLabel;
@synthesize dateListenedLabel;

- (id) initWithLabel:(UILabel *) firstLabel :(UILabel *) secondLabel {
    self = [super init];
    if (self) {
        self.artistLabel = firstLabel;
        self.songLabel = secondLabel;
    }
    return self;
}

- (id) initWithLabel:(UILabel *)firstLabel :(UILabel *)secondLabel :(UILabel *)thirdLabel :(UILabel *)fourthLabel :(UILabel *)fifthLabel :(UILabel *)sixthLabel {
    self = [super init];
    if (self) {
        self.artistLabel = firstLabel;
        self.songLabel = secondLabel;
        self.albumLabel = thirdLabel;
        self.songGenreLabel = fourthLabel;
        self.releaseDateLabel = fifthLabel;
        self.dateListenedLabel = sixthLabel;
    }
    return self;
}

- (void) GNResultReady:(GNSearchResult *)result {
    GNSearchResponse *best = [result bestResponse];
    if (![result isFailure] && (best.artist != nil)) {
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM/dd/yyyy"];
        
        [self.artistLabel setText: best.artist];
        [self.songLabel setText: best.trackTitle];
        [self.songGenreLabel setText: @""];
        //[self.songGenreLabel setText: best.trackGenre[0]];
        [self.releaseDateLabel setText: [@"Release Date: " stringByAppendingString: best.albumReleaseYear]];
        [self.albumLabel setText: [@"Album: " stringByAppendingString: best.albumTitle]];
        [self.dateListenedLabel setText: [@"Date Listened: " stringByAppendingString: [formatter stringFromDate: [[NSDate alloc] init]]]];
    }
    else {
        [self.artistLabel setText: @"No Match!"];
    }
}

@end
