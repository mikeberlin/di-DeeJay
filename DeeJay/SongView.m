//
//  SongView.m
//  DeeJay
//
//  Created by Mike Berlin on 5/8/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "SongView.h"
#import "ShareRegularLabel.h"
#import "ShareBoldLabel.h"

@implementation SongView

BOOL isPlayingMusic = false;

#pragma mark - Property Lazy Loading
- (UIImageView *)ivSongBG {
    if (_ivSongBG == nil) _ivSongBG = [[UIImageView alloc] init];
    return _ivSongBG;
}

- (UIImageView *)ivAlbumBG {
    if (_ivAlbumBG == nil) _ivAlbumBG = [[UIImageView alloc] init];
    return _ivAlbumBG;
}

- (UIImageView *)ivSongTitleBG {
    if (_ivSongTitleBG == nil) _ivSongTitleBG = [[UIImageView alloc] init];
    return _ivSongTitleBG;
}

- (ShareRegularLabel *)lblTitle {
    if (_lblTitle == nil) _lblTitle = [[ShareRegularLabel alloc] init];
    return _lblTitle;
}

- (ShareBoldLabel *)lblArtist {
    if (_lblArtist == nil) _lblArtist = [[ShareBoldLabel alloc] init];
    return _lblArtist;
}

#pragma mark - Messages
- (IBAction)playSong:(UIButton *)sender {

    if ((sender.titleLabel.text == nil) || ([sender.titleLabel.text isEqualToString:@"Paused"])) {
        self.btnPlayPause.titleLabel.text = @"Playing";
        self.btnPlayPause.imageView.image = [UIImage imageNamed:@"PauseIcon.png"];
        [self.vcMain playMusicWithFileName:self.fileName fileExtension:self.fileExtension];
    }
    else if ([sender.titleLabel.text isEqualToString:@"Playing"]) {
        self.btnPlayPause.titleLabel.text = @"Paused";
        self.btnPlayPause.imageView.image = [UIImage imageNamed:@"PlayIcon.png"];
        [self.vcMain pauseMusic];
    }
}

- (void)setupSongWithArtist:(NSString *)artist
                      title:(NSString *)title
                   albumArt:(UIImage *)albumArt
                   fileName:(NSString *)fileName
              fileExtension:(NSString *)fileExtension {

    self.lblArtist.text = artist;
    self.lblTitle.text = title;
    self.ivAlbumBG.image = albumArt;
    self.fileName = fileName;
    self.fileExtension = fileExtension;
}

@end