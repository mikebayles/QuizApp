//
//  StudentAnswer.h
//  QuizClient
//
//  Created by Mike Bayles on 11/18/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
@protocol StudentAnswer @end
@interface StudentAnswer : JSONModel
@property NSString* student;
@property NSInteger answer;
@end
