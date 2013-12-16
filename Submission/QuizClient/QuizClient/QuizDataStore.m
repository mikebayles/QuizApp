//
//  QuizDataStore.m
//  QuizClient
//
//  Created by Mike Bayles on 11/7/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizDataStore.h"

@implementation QuizDataStore
@synthesize auth = auth;
@synthesize quizes = _quizes;
@synthesize quizInProgress = _quizInProgress;

static QuizDataStore *gInstance = NULL;

+ (QuizDataStore *)instance
{
    @synchronized(self)
    {
        if (gInstance == NULL)
            gInstance = [[self alloc] init];
    }
    
    return(gInstance);
}

@end
