//
//  Grade.m
//  QuizClient
//
//  Created by Mike Bayles on 12/11/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "Grade.h"

@implementation Grade
@synthesize quizDescription = _quizDescription;
@synthesize pointsEarned = _pointsEarned;
@synthesize pointsPossible = _pointsPossible;
@synthesize percentage = _percentage;
@synthesize letterGrade = _letterGrade;

-(NSString*) toString
{
    NSString* letterGrade = [[NSString alloc] initWithFormat:@"%@     ",self.letterGrade];
    
    NSString* description = [Grade appendSpaces:self.quizDescription length:12];
    NSString* points = [[NSString alloc] initWithFormat:@"%i/%i",self.pointsEarned,self.pointsPossible];
    return [[NSString alloc] initWithFormat:@"%@ %@ %@", letterGrade, description,points];
}

//- (void)first:(NSString *)fname second:(NSString *)mname third:(NSString )lname;
+(NSString* ) appendSpaces: (NSString*)word length:(NSInteger) length
{
    NSInteger difference = length - word.length;
    if(difference == 0)
        return word;
    else if(difference < 0)
        return [word substringToIndex:length];
    else if(difference > 0)
    {
        NSMutableString* mutableCopy = [[NSMutableString alloc] initWithString:word];
        
        int i;
        for (i = 0;i < difference; i++)
        {
            [mutableCopy appendString:@" "];
        }
        
        return mutableCopy;
    }
    return @"";
}

@end
