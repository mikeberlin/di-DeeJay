//
//  SongView.h
//  DeeJay
//
//  Created by Mike Berlin on 5/8/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "ShareRegularLabel.h"
#import "ShareBoldLabel.h"

@interface SongView : UIView

@property (strong, nonatomic) IBOutlet UIImageView *ivSongBG;
@property (strong, nonatomic) IBOutlet UIImageView *ivAlbumBG;
@property (strong, nonatomic) IBOutlet UIImageView *ivSongTitleBG;
@property (strong, nonatomic) IBOutlet ShareRegularLabel *lblTitle;
@property (strong, nonatomic) IBOutlet ShareBoldLabel *lblArtist;
@property (strong, nonatomic) IBOutlet UIButton *btnPlayPause;

@property (strong, nonatomic) NSString *fileName;
@property (strong, nonatomic) NSString *fileExtension;
@property (strong, nonatomic) MainViewController *vcMain;

- (IBAction)playSong:(UIButton *)sender;

- (void)setupSongWithArtist:(NSString *)artist
                      title:(NSString *)title
                   albumArt:(UIImage *)albumArt
                   fileName:(NSString *)fileName
              fileExtension:(NSString *)fileExtension;

@end