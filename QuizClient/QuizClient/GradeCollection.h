//
//  GradeCollection.h
//  QuizClient
//
//  Created by Mike Bayles on 12/11/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "JSONModel.h"
#import "Grade.h"

@interface GradeCollection : JSONModel
@property NSArray<Grade,ConvertOnDemand>* grades;
@end
