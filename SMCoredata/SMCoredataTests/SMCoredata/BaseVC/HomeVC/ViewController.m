//
//  ViewController.m
//  SMCoredata
//
//  Created by Shankar Mallick on 15/04/16.
//  Copyright © 2016 Customer First. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark--------------
#pragma mark text field delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField==txtfldname){
        [txtfldImgUrl becomeFirstResponder];
    }else if (textField==txtfldImgUrl){
        [txtfldImgUrl resignFirstResponder];
    }
    return YES;
}
#pragma mark------------
#pragma mark button action
- (IBAction)savedata:(id)sender {
    
}

- (IBAction)showdata:(id)sender {
}

- (IBAction)searchdata:(id)sender {
}
@end
