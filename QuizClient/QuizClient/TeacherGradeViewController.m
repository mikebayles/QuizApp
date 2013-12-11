//
//  TeacherGradeViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 12/10/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "TeacherGradeViewController.h"

@interface TeacherGradeViewController ()

@end

@implementation TeacherGradeViewController
{
    NSArray* tableData;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
    
    cell.textLabel.text = [[tableData objectAtIndex:indexPath.row] toString];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"TakeQuiz" sender:self];
}



@end
