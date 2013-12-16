//
//  Grade.h
//  QuizClient
//
//  Created by Mike Bayles on 12/11/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//



#import "JSONModel.h"
@protocol Grade @end
@interface Grade : JSONModel
@property NSString* quizDescription;
@property NSString* student;
@property NSString* course;
@property NSInteger pointsPossible;
@property NSInteger pointsEarned;
@property float percentage;
@property NSString* letterGrade;

+(NSString* ) appendSpaces: (NSString*)word length:(NSInteger) length;
-(NSString*) toString;
@end
