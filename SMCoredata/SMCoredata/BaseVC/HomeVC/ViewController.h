//
//  ViewController.h
//  SMCoredata
//
//  Created by Shankar Mallick on 15/04/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{

    __weak IBOutlet UITextField *txtfldImgUrl;
    __weak IBOutlet UITextField *txtfldname;
    
    __weak IBOutlet UIImageView *imgVw4feml;
    __weak IBOutlet UIImageView *imgVw4ml;
    NSString *strgender;
    
    
}

- (IBAction)savedata:(id)sender;
- (IBAction)showdata:(id)sender;
- (IBAction)searchdata:(id)sender;

@end

