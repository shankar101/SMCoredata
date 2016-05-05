//
//  PopupVwRename.h
//  SMCoredata
//
//  Created by Shankar Mallick on 04/05/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol rename <NSObject>
-(void)renamewithnewtext:(NSString *)strtxt withobject:(UserInfo *)objuserinfo;
@end
@interface PopupVwRename : UIView
{

    __weak IBOutlet UITextField *txtfld4edt;
    id <rename>_rename;
    NSString *strname;
    UserInfo *objuserinfo;
}

@property (nonatomic,strong)id <rename>_rename;
@property (nonatomic,strong)NSString *strname;

+ (instancetype)instantiateFromNib;
-(void)loadxibwithvaluewithuserobject:(UserInfo *)objuser;
- (IBAction)editDatasave:(id)sender;

@end
