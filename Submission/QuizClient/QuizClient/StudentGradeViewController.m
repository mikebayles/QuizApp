//
//  StudentGradeViewController.m
//  QuizClient
//
//  Created by Mike Bayles on 12/11/13.
//  Copyright (c) 2013 Mike Bayles. All rights reserved.
//

#import "StudentGradeViewController.h"
#import "QuizNetworkHelp.h"
#import "QuizDataStore.h"
#import "GradeCollection.h"
#import "CourseCollection.h"

@interface StudentGradeViewController ()
{
    NSArray* tableData;
    NSArray* itemsArray;
}
@end

@implementation StudentGradeViewController
@synthesize tableView = _tableView;
@synthesize coursePicker = _coursePicker;
- (void)viewDidLoad
{
    [super viewDidLoad];
	   
    
    
    itemsArray = [self refreshCourses].courses;

    [self refreshData];
    //[self.tableView setSeparatorInset:UIEdgeInsetsZero];
}

-(void) refreshData
{
    
    NSInteger row = [self.coursePicker selectedRowInComponent:0];
    NSString* courseText =((Course*)[itemsArray objectAtIndex:row]).id;
    NSString* message = [NSString stringWithFormat:@"method=getStudentGrades&student=%@&course=%@",[QuizDataStore instance].auth.username,courseText];
    NSString* response = [QuizNetworkHelp makePostRequest:message withServlet:@"QuizServlet"];
    
    NSError *err;
    
    GradeCollection* grades = [[GradeCollection alloc] initWithString:response error: &err ];
    
    tableData = grades.grades;
    [self.tableView reloadData];

}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
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
    cell.textLabel.font = [UIFont systemFontOfSize:17];
    cell.textLabel.text = [[tableData objectAtIndex:indexPath.row] toString];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self performSegueWithIdentifier:@"TakeQuiz" sender:self];
}



// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [itemsArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return ((Course*)[itemsArray objectAtIndex:row]).id;
}




- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSString *sectionTitle = @"Grade Description Points";
    
    // Create label with section title
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(0, 0, 284, 23);
    label.textColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:@"System" size:17];
    label.text = sectionTitle;
    label.backgroundColor = [UIColor clearColor];
    
    // Create header view and add label as a subview
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    [view addSubview:label];
    
    return view;
}

-(CourseCollection*) refreshCourses
{
    
    NSString* message = [NSString stringWithFormat:@"method=getCourses"];
    NSString* response = [QuizNetworkHelp makePostRequest:message withServlet:@"CreateServlet"];
    
    NSError *err;
    
    CourseCollection* ret = [[CourseCollection alloc] initWithString:response error: &err ];
    
    return ret;
}

@end
