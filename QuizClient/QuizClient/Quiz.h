//
//  Quiz.h
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
#import "Question.h"
#import "Course.h"
@protocol Quiz @end
@interface Quiz : JSONModel
@property NSInteger id;
@property NSArray<Question, ConvertOnDemand>* questions;
@property NSString* description;
@property Course* course;
@end
