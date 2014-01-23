//
//  WebViewController.h
//  Dribbble
//
//  Created by Amir Moravej on 1/23/2014.
//  Copyright (c) 2014 Amir Moravej. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) NSURL *ShotURL;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
