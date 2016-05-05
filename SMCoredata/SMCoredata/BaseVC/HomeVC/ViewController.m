//
//  ViewController.m
//  SMCoredata
//
//  Created by Shankar Mallick on 15/04/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import "ViewController.h"
#import "ListVC.h"
#import "SearchVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *TapRecognizer4ml = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changegender:)];
    UITapGestureRecognizer *TapRecognizer4feml = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changegender:)];
    [imgVw4ml addGestureRecognizer:TapRecognizer4ml];
    [imgVw4feml addGestureRecognizer:TapRecognizer4feml];
    
    [imgVw4feml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonDeselect"]];
    [imgVw4ml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonDeselect"]];
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
    if(strgender.length>0 && txtfldname.text.length>0 && txtfldImgUrl.text.length>0){
        [[DBqueryHanadler sharedInstance] savedatawithName:txtfldname.text withimageurl:txtfldImgUrl.text withgender:strgender];
        txtfldImgUrl.text=@"";
        txtfldname.text=@"";
        [imgVw4feml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonDeselect"]];
        [imgVw4ml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonDeselect"]];
        strgender=@"";
        [self showalertWithMessage:@"Successfully saved."];
       
    }else{
        [self showalertWithMessage:@"Please check everything."];
        
    }
    //http://useyourloaf.com/blog/uialertcontroller-changes-in-ios-8/
}

- (IBAction)showdata:(id)sender {
    ListVC *mListVC = [self.storyboard instantiateViewControllerWithIdentifier: @"ListVC"];
    [self.navigationController pushViewController:mListVC animated:YES];
}

- (IBAction)searchdata:(id)sender {
    SearchVC *mSearchVC = [self.storyboard instantiateViewControllerWithIdentifier: @"SearchVC"];
    [self.navigationController pushViewController:mSearchVC animated:YES];
}

- (void)changegender:(UITapGestureRecognizer*)sender {
     UIImageView *imgVw = (UIImageView *)sender.view;
    if(imgVw.tag==101){
        strgender=@"Male";
        [imgVw4feml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonDeselect"]];
        [imgVw4ml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonSelect"]];
    }else{
        
        strgender=@"Female";
        [imgVw4ml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonDeselect"]];
        [imgVw4feml setImage:[UIImage imageNamed:@"BenefitsRadioBuoonSelect"]];
    }
    
}

-(void)showalertWithMessage:(NSString *)strMsg{
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@"SMCoreData"
                                          message:strMsg
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
