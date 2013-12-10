//
//  QuizInitiator.m
//  QuizClient
//
//  Created by Mike Bayles on 12/8/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "QuizInitiator.h"
#import "Quiz.h"
#import "QuizDataStore.h"
#import "QuizNetworkHelp.h"

@implementation QuizInitiator
@synthesize cboCourse = _cboCourse;
@synthesize itemsArray = _itemsArray;
@synthesize brain = _brain;
@synthesize lblError = _lblError;
@synthesize txtDescription = _txtDescription;

- (QuizInitiatorBrain *) brain
{
    if(!_brain) _brain = [[QuizInitiatorBrain alloc] init];
    return _brain;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.itemsArray = [self.brain getCourses].courses;//[[NSArray alloc] initWithObjects:@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 6", nil];
    self.lblError.text = @"";
	[self.lblError setTextColor:[UIColor redColor]];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.itemsArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return ((Course*)[self.itemsArray objectAtIndex:row]).id;
}

- (IBAction)btnContinue:(id)sender
{
    if(self.txtDescription.text.length == 0)
    {
        self.lblError.text = @"Please enter a quiz description";
        return;
    }
    
    Course* course = [self.itemsArray objectAtIndex:[self.cboCourse selectedRowInComponent:0]];
  
    Quiz* quiz = [Quiz new];
    quiz.description = self.txtDescription.text;
    quiz.course = course;
    
    [QuizDataStore instance].quizInProgress = quiz;
    
    self.lblError.text = @"";
    [self performSegueWithIdentifier:@"createQuizSegue" sender:self];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.txtDescription resignFirstResponder];
    
}

- (void) startTimer
{
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(tick:)
                                   userInfo:nil
                                    repeats:YES];
}

- (void) tick:(NSTimer *) timer
{
    NSString* teacher = [QuizDataStore instance].auth.username;
    NSString* message = [NSString stringWithFormat:@"method=getPing&teacher=%@",teacher];
    
    NSString* response = [QuizNetworkHelp makePostRequest:message withServlet:@"QuizServlet"];
    
}

@end
