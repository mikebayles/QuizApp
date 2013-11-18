//
//  QuizTakeViewController.h
//  QuizClient
//
//  Created by Mike Bayles on 11/7/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizTakeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segAnswer;
@property (weak, nonatomic) IBOutlet UIButton *btnNext;
@property (weak, nonatomic) IBOutlet UIButton *btnPrevious;
@property (weak, nonatomic) IBOutlet UITableView *tblQuestion;
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property int quizIndex;
@end
