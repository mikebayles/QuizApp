//
//  QuizCollection.h
//  QuizClient
//
//  Created by Mike Bayles on 11/2/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
#import "Quiz.h"

@interface QuizCollection : JSONModel
@property NSArray<Quiz, ConvertOnDemand>* quizes;
@end
