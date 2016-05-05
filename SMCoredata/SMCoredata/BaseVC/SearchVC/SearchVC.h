//
//  SearchVC.h
//  SMCoredata
//
//  Created by Shankar Mallick on 03/05/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopupVwRename.h"

@interface SearchVC : UIViewController<rename>
{
    NSMutableArray *arrsrchList;
    __weak IBOutlet UISearchBar *srchbr;
    __weak IBOutlet UITableView *tblVw4srchlist;
    PopupVwRename *_popupRename;
}
- (IBAction)backtoprevious:(id)sender;
@end
