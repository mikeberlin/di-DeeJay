//
//  MainViewController.h
//  DeeJay
//
//  Created by Mike Berlin on 5/8/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface MainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIScrollView *svSongList;

@property (strong, nonatomic) MPMoviePlayerController *musicPlayer;

- (void)playMusicWithFileName:(NSString *)fileName fileExtension:(NSString *)fileExtension;
- (void)pauseMusic;

@end