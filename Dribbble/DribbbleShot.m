//
//  DribbbleShot.m
//  Dribbble
//
//  Created by Amir Moravej on 1/23/2014.
//  Copyright (c) 2014 Amir Moravej. All rights reserved.
//

#import "DribbbleShot.h"

@implementation DribbbleShot

- (id) initWithTitle:(NSString *)_title {
    self = [super init];
    
    if (self) {
        self.title = _title;
    }
    return self;
}

+ (id) dribbbleShotWithTitle:(NSString *) t {
    return [[self alloc] initWithTitle:t];
}

@end
