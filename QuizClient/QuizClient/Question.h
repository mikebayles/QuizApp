//
//  Question.h
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
#import "Answer.h"

@protocol Question @end
@interface Question : JSONModel
@property NSInteger id;
@property NSString* text;
@property NSArray<Answer, ConvertOnDemand>* answers;
@end
