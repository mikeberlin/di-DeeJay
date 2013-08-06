//
//  MainViewController.m
//  DeeJay
//
//  Created by Mike Berlin on 5/8/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <MediaPlayer/MediaPlayer.h>
#import "MainViewController.h"
#import "SongView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [self setupNavigationBarStyling];
    [self loadSongs];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Messages
- (void)playMusicWithFileName:(NSString *)fileName fileExtension:(NSString *)fileExtension {
    [self.musicPlayer pause];

    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:fileExtension];

    if (self.musicPlayer == nil) self.musicPlayer = [[MPMoviePlayerController alloc] init];
    self.musicPlayer.movieSourceType = MPMovieSourceTypeFile;
    self.musicPlayer.contentURL = [NSURL fileURLWithPath:path];
    self.musicPlayer.shouldAutoplay = NO;

    [self.musicPlayer play];
}

- (void)pauseMusic {
    [self.musicPlayer pause];
}

#pragma mark - Private Messages

- (void)setupNavigationBarStyling {
    UIImage *navBG = [UIImage imageNamed:@"NavBar.png"];
    [self.navigationController.navigationBar setBackgroundImage:navBG forBarMetrics:UIBarMetricsDefault];
    
    UIImage *navLogo = [UIImage imageNamed:@"Logo.png"];
    UIImageView *ivLogo = [[UIImageView alloc] initWithImage:navLogo];
    [self.navigationItem setTitleView:ivLogo];
}

- (void)loadSongs {
    NSArray *songList = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SongList" ofType:@"plist"]];

    UINib *songNib = [UINib nibWithNibName:@"SongView" bundle:[NSBundle mainBundle]];
    CGRect frame;
    SongView *svView;
    NSInteger currentRow = 0;

    for (int i = 0; i < songList.count; i++) {
        NSDictionary *song = songList[i];
        svView = [[songNib instantiateWithOwner:nil options:nil] lastObject];
        [svView setupSongWithArtist:[song valueForKey:@"Artist"]
                              title:[song valueForKey:@"Title"]
                           albumArt:[UIImage imageNamed:[song valueForKey:@"AlbumArtFileName"]]
                           fileName:[song valueForKey:@"SongFileName"]
                      fileExtension:[song valueForKey:@"SongFileExtension"]];

        frame.origin.x = 170;
        if (i % 2 == 0) {
            frame.origin.x = 20;
            currentRow = (i == 0) ? 0 : currentRow + 1;
        }

        frame.origin.y = 20 + (currentRow * (135+20));
        frame.size = svView.frame.size;

        svView.frame = frame;
        svView.vcMain = self;
        [self.svSongList addSubview:svView];
    }

    self.svSongList.frame = CGRectMake(0, 0, self.svSongList.frame.size.width, (155 * (currentRow + 1)));
    NSLog(@"frame width: %0.0f", self.svSongList.frame.size.width);
    NSLog(@"frame height: %0.0f", self.svSongList.frame.size.height);
}

@end