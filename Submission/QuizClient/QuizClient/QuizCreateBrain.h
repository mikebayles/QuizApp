//
//  QuizCreateBrain.h
//  QuizClient
//
//  Created by Mike Bayles on 12/9/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Quiz.h"

@interface QuizCreateBrain : NSObject
-(BOOL) createQuiz: (Quiz*) quiz;
@end
