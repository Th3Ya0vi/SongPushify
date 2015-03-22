//
//  FPResponse.h
//  SongPush
//
//  Created by Nishanth Salinamakki on 3/21/15.
//  Copyright (c) 2015 Nishanth Salinamakki. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <GracenoteMusicID/GNSearchResultReady.h>

@interface FPResponse : NSObject <GNSearchResultReady> {
    
}

@property (strong, nonatomic) UILabel *artistLabel;
@property (strong, nonatomic) UILabel *songLabel;
@property (strong, nonatomic) UILabel *songGenreLabel;
@property (strong, nonatomic) UILabel *albumLabel;
@property (strong, nonatomic) UILabel *releaseDateLabel;
@property (strong, nonatomic) UILabel *dateListenedLabel;

- (id) initWithLabel: (UILabel *) firstLabel :(UILabel *) secondLabel;
- (id) initWithLabel: (UILabel *) firstLabel :(UILabel *) secondLabel :(UILabel *) thirdLabel :(UILabel *) fourthLabel :(UILabel *) fifthLabel :(UILabel *) sixthLabel;
- (void) GNResultReady:(GNSearchResult *)result;

@end
