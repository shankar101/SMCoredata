//
//  ListVC.h
//  SMCoredata
//
//  Created by Shankar Mallick on 02/05/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListVC : UIViewController
{
    NSMutableArray *arrList;
    __weak IBOutlet UITableView *tblVw4datalist;
}
- (IBAction)backtoprevious:(id)sender;
- (IBAction)switchChange:(id)sender;
@end
