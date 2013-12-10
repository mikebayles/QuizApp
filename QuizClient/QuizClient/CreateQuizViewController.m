//
//  CreateQuizViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 11/21/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "CreateQuizViewController.h"
#import "QuizDataStore.h"


@implementation CreateQuizViewController
@synthesize txtQuestion = _txtQuestion;
@synthesize txtAnswer1 = _txtAnswer1;
@synthesize txtAnswer2 = _txtAnswer2;
@synthesize txtAnswer3 = _txtAnswer3;
@synthesize txtAnswer4 = _txtAnswer4;
@synthesize txtAnswer5 = _txtAnswer5;
@synthesize questions = _questions;
@synthesize segCorrect = _segCorrect;
@synthesize brain = _brain;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.txtQuestion.layer.borderWidth = 1.0f;
    self.questions = [NSMutableArray new];
}

- (QuizCreateBrain *) brain
{
    if(!_brain) _brain = [[QuizCreateBrain alloc] init];
    return _brain;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtQuestion resignFirstResponder];
    [self.txtAnswer1 resignFirstResponder];
    [self.txtAnswer2 resignFirstResponder];
    [self.txtAnswer3 resignFirstResponder];
    [self.txtAnswer4 resignFirstResponder];
    [self.txtAnswer5 resignFirstResponder];
    
}

-(void) createQuestion
{
    Question* question = [[Question alloc] init];
    question.text = self.txtQuestion.text;
    
    NSMutableArray* answers = [NSMutableArray new];
    
    Answer* answer1 = [[Answer alloc] init];
    answer1.text = self.txtAnswer1.text;
    answer1.correct = self.segCorrect.selectedSegmentIndex == 0;
    
    Answer* answer2 = [[Answer alloc] init];
    answer2.text = self.txtAnswer2.text;
    answer2.correct = self.segCorrect.selectedSegmentIndex == 1;
    
    Answer* answer3 = [[Answer alloc] init];
    answer3.text = self.txtAnswer3.text;
    answer3.correct = self.segCorrect.selectedSegmentIndex == 2;
    
    Answer* answer4 = [[Answer alloc] init];
    answer4.text = self.txtAnswer4.text;
    answer4.correct = self.segCorrect.selectedSegmentIndex == 3;
    
    Answer* answer5 = [[Answer alloc] init];
    answer5.text = self.txtAnswer5.text;
    answer5.correct = self.segCorrect.selectedSegmentIndex == 4;
    
    if([answer1.text length] > 0)
        [answers addObject:answer1];
    if([answer2.text length] > 0)
        [answers addObject:answer2];
    if([answer3.text length] > 0)
        [answers addObject:answer3];
    if([answer4.text length] > 0)
        [answers addObject:answer4];
    if([answer5.text length] > 0)
        [answers addObject:answer5];
    
    question.answers = [NSArray arrayWithArray:answers];
    if(answers.count > 0)
        [self.questions addObject:question];
}

- (IBAction)btnNextClicked:(id)sender
{
    [self createQuestion];
    [self.txtAnswer1 setText:@""];
    [self.txtAnswer2 setText:@""];
    [self.txtAnswer3 setText:@""];
    [self.txtAnswer4 setText:@""];
    [self.txtAnswer5 setText:@""];
    [self.txtQuestion setText:@""];
    
    self.segCorrect.selectedSegmentIndex = 0;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField: textField up: NO];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}
- (IBAction)btnSubmit:(id)sender
{
    [self createQuestion];
    
    Quiz* quiz = [QuizDataStore instance].quizInProgress;
    quiz.questions = self.questions;
    
    if([self.brain createQuiz:quiz])
    {
        [self.questions removeAllObjects];
        [self performSegueWithIdentifier:@"createQuizSuccess" sender:self];
    }
    
}

@end
