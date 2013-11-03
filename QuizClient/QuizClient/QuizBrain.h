//
//  QuizBrain.h
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuizCollection.h"

@interface QuizBrain : NSObject
-(QuizCollection*) getQuizes;
-(QuizCollection *) refreshQuizes;
@end
