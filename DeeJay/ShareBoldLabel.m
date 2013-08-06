//
//  ShareBoldLabel.m
//  DeeJay
//
//  Created by Mike Berlin on 5/8/13.
//  Copyright (c) 2013 Mike Berlin. All rights reserved.
//

#import "ShareBoldLabel.h"

@implementation ShareBoldLabel

- (void)awakeFromNib {
    UIFont *font = [UIFont fontWithName:@"Share-Bold" size:self.font.pointSize];
    self.font = font;
}

@end