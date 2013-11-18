//
//  QuizTakeViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 11/7/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizTakeViewController.h"
#import "QuizDataStore.h"


@implementation QuizTakeViewController
{
    NSArray* tableData;
    NSArray* letters;
}
@synthesize segAnswer = _segAnswer;



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    letters = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D","E",@"F", nil];
    Quiz* currentQuiz = [[QuizDataStore instance].quizes.quizes objectAtIndex:0];
                         
    Question* currentQuestion = [currentQuiz.questions objectAtIndex:0];
                         
    [self.segAnswer removeAllSegments];
    NSMutableArray * tempData = [[NSMutableArray alloc] init];
    for(int i = 0; i < currentQuestion.answers.count; i++)
    {
        Answer* currentAnswer = [currentQuestion.answers objectAtIndex:i];
        
        NSString* text = [NSString stringWithFormat:@"%@ - %@",[letters objectAtIndex:i],currentAnswer.text];
        [tempData addObject:text];
        
        [self.segAnswer insertSegmentWithTitle:[letters objectAtIndex:i] atIndex:i animated:YES];
    }
    
    tableData = tempData;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [[tableData objectAtIndex:indexPath.row] description];
    cell.textLabel.font = [UIFont systemFontOfSize:8.0];
    return cell;
}


@end
