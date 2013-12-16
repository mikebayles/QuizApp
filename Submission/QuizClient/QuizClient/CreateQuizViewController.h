//
//  CreateQuizViewController.h
//  QuizClient
//
//  Created by Mike Bayles on 11/21/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "QuizCreateBrain.h"

@interface CreateQuizViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *txtQuestion;
@property (weak, nonatomic) IBOutlet UITextField *txtAnswer1;
@property (weak, nonatomic) IBOutlet UITextField *txtAnswer2;
@property (weak, nonatomic) IBOutlet UITextField *txtAnswer3;
@property (weak, nonatomic) IBOutlet UITextField *txtAnswer4;
@property (weak, nonatomic) IBOutlet UITextField *txtAnswer5;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segCorrect;
@property NSMutableArray<Question, ConvertOnDemand> *questions;
@property (nonatomic,strong)QuizCreateBrain* brain;
@end
