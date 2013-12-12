//
//  StudentGradeViewController.h
//  QuizClient
//
//  Created by Mike Bayles on 12/11/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentGradeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIPickerView *coursePicker;

@end
