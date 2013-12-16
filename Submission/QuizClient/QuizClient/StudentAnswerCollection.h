//
//  StudentAnswerCollection.h
//  QuizClient
//
//  Created by Mike Bayles on 11/18/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
#import "StudentAnswer.h"

@interface StudentAnswerCollection : JSONModel
@property NSArray<StudentAnswer, ConvertOnDemand>* studentAnswers;
@end
