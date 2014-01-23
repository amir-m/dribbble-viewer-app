//
//  DribbbleShot.h
//  Dribbble
//
//  Created by Amir Moravej on 1/23/2014.
//  Copyright (c) 2014 Amir Moravej. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DribbbleShot : NSObject

- (id) initWithTitle:(NSString *)_title;

+ (id) dribbbleShotWithTitle:(NSString *) t;

@property (strong, nonatomic) NSString *title;
@property (nonatomic) int height;
@property (nonatomic) int width;
@property (nonatomic) int likes_count;
@property (nonatomic) int comments_count;
@property (nonatomic) int views_count;
@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSURL *shotURL;

@end
