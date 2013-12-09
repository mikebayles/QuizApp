//
//  QuizDataStore.h
//  QuizClient
//
//  Created by Mike Bayles on 11/7/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Auth.h"
#import "QuizCollection.h"

@interface QuizDataStore : NSObject
@property Auth* auth;
@property QuizCollection* quizes;
@property Quiz* quizInProgress;
+ (QuizDataStore *)instance;
@end
