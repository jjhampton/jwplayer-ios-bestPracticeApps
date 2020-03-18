//
//  JWBasicVideoViewController.m
//  JWBestPracticeApps
//
//  Created by Karim Mourra on 3/16/16.
//  Copyright © 2016 Karim Mourra. All rights reserved.
//

#import "JWBasicVideoViewController.h"

#define videoFile @"http://playertest.longtailvideo.com/adaptive/oceans/oceans.m3u8"
#define posterImage @"http://d3el35u4qe4frz.cloudfront.net/bkaovAYt-480.jpg"

@interface JWBasicVideoViewController ()

@end

@implementation JWBasicVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPlayer];
}

-(void)viewDidAppear:(BOOL)animated
{
    [self.view addSubview:self.player.view];
}

- (void)createPlayer
{
    JWConfig *config = [self createConfig];
    self.player = [[JWPlayerController alloc]initWithConfig:config];
    self.player.forceLandscapeOnFullScreen = YES;
    self.player.forceFullScreenOnLandscape = YES;
    self.player.view.center = self.view.center;
    self.player.delegate = self;
}

- (JWConfig *)createConfig
{
    JWConfig* config = [[JWConfig alloc]initWithContentUrl:videoFile];
    config.image = posterImage;
    config.size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.width);
    config.autostart = YES;
    config.repeat = YES;
        
    // The following IMA preroll ad will play if using Google IMA SDK v3.9.2, but will not play if using Google IMA SDK v3.11.2
    // This can be tested by changing the Google IMA SDK version in the Podfile, running 'pod install', and rebuilding the app
    // This occurs when using from JWPlayer iOS SDK v3.6.3 up to JWPlayer iOS SDK 3.11.0
    
    JWAdBreak *adBreak = [[JWAdBreak alloc] initWithTags:@[@"https://pubads.g.doubleclick.net/gampad/ads?sz=640x480&iu=/124319096/external/single_ad_samples&ciu_szs=300x250&impl=s&gdfp_req=1&env=vp&output=vast&unviewed_position_start=1&cust_params=deployment%3Ddevsite%26sample_ct%3Dlinear&correlator="] offset:@"pre"];
    
    config.advertising = [JWAdConfig new];
    config.advertising.client = JWAdClientGoogima;
    // The preroll ad will also play, if switching configuration back to Vast instead of IMA config
    // config.advertising.client = JWAdClientVast

    config.advertising.schedule = @[adBreak];
    return config;
}

@end
