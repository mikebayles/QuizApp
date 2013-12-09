//
//  QuizInitiator.h
//  QuizClient
//
//  Created by Mike Bayles on 12/8/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizInitiatorBrain.h"

@interface QuizInitiator : UIViewController
@property (weak, nonatomic) IBOutlet UIPickerView *cboCourse;
@property NSArray* itemsArray;
@property (weak, nonatomic) IBOutlet UILabel *lblError;
@property (weak, nonatomic) IBOutlet UITextField *txtDescription;
@property (nonatomic,strong) QuizInitiatorBrain* brain;
@end
