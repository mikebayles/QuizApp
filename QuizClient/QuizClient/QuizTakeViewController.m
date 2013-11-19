//
//  QuizTakeViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 11/7/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizTakeViewController.h"
#import "QuizDataStore.h"
#import "StudentAnswer.h"
#import "StudentAnswerCollection.h"
#import "QuizNetworkHelp.h"


@implementation QuizTakeViewController
{
    NSMutableArray* tableData;
    NSMutableArray* studentAnswers;
    NSArray* letters;
    int questionIndex;
    Quiz* currentQuiz;
    Question* currentQuestion;
    Answer* currentAnswer;
}
@synthesize segAnswer = _segAnswer;
@synthesize btnNext = _btnNext;
@synthesize btnPrevious = _btnPrevious;
@synthesize quizIndex = _quizIndex;
@synthesize tblQuestion = _tblQuestion;
@synthesize lblQuestion =_lblQuestion;
- (void)viewDidLoad
{
    [super viewDidLoad];
    questionIndex = 0;
    
    letters = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F", nil];
    studentAnswers = [[NSMutableArray alloc] init];
    currentQuiz = [[QuizDataStore instance].quizes.quizes objectAtIndex:0];
    
    self.tblQuestion.layer.borderWidth = 1.0f;
                         
    [self refreshData];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//self.segAnswer.selectedSegmentIndex = indexPath.row;
    StudentAnswer* stdAnswer = [[StudentAnswer alloc] init];
    stdAnswer.student = [QuizDataStore instance].auth.username;
    stdAnswer.answer = ((Answer *)[currentQuestion.answers objectAtIndex:indexPath.row]).id;
    [studentAnswers insertObject:stdAnswer atIndex:questionIndex];
}


-(void) refreshData
{
    //[self.segAnswer removeAllSegments];
    tableData = [[NSMutableArray alloc] init];
    currentQuestion = [currentQuiz.questions objectAtIndex:questionIndex];
    self.lblQuestion.text = currentQuestion.text;
    for(int i = 0; i < currentQuestion.answers.count; i++)
    {
        currentAnswer = [currentQuestion.answers objectAtIndex:i];
        
        NSString* text = [NSString stringWithFormat:@"%@ - %@",[letters objectAtIndex:i],currentAnswer.text];
        [self.segAnswer insertSegmentWithTitle:[letters objectAtIndex:i] atIndex:i animated:YES];
        [tableData addObject:text];
    }
    
    [self refreshButtons];
    [self.tblQuestion reloadData];
}

-(void) refreshButtons
{
    self.btnPrevious.hidden = questionIndex == 0;
    //self.btnNext.hidden = questionIndex == tableData.count - 1;
    if(questionIndex == tableData.count - 1)
        [self.btnNext setTitle:@"Submit" forState:UIControlStateNormal];
    else
        [self.btnNext setTitle:@"Next Question" forState:UIControlStateNormal];
}
- (IBAction)btnNextPressed:(id)sender
{
    if(questionIndex == tableData.count - 1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait" message:@"Are you sure you want to submit?  This action cannot be undone" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
        [alert show];
    }
    else
    {
        questionIndex++;
        [self refreshData];
    }
}
- (IBAction)btnPreviousPressed:(id)sender
{
    questionIndex--;
    [self refreshData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1)
    {
        StudentAnswerCollection*  collection = [[StudentAnswerCollection alloc] init];
        collection.studentAnswers = studentAnswers;
        NSString* message = [NSString stringWithFormat:@"method=submit&json=%@",[collection toJSONString]];
        
        NSString* response = [QuizNetworkHelp makePostRequest:message withServlet:@"QuizServlet"];
        
        [self performSegueWithIdentifier:@"viewGrades" sender:self];
        
    }
}
@end
