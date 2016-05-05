//
//  PopupVwRename.m
//  SMCoredata
//
//  Created by Shankar Mallick on 04/05/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import "PopupVwRename.h"
#import "CustomeCell4MotrCyclPrf.h"
#import "VIBCellDesigner.h"

@implementation PopupVwRename
@synthesize _rename,strname;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)instantiateFromNib
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:[NSString stringWithFormat:@"%@", [self class]] owner:nil options:nil];
    return [views firstObject];
}
-(void)loadxibwithvaluewithuserobject:(UserInfo *)objuser{
    txtfld4edt.text=strname;
    [txtfld4edt becomeFirstResponder];
    objuserinfo=objuser;
}
- (IBAction)editDatasave:(id)sender {
    if (_rename && [_rename respondsToSelector:@selector(renamewithnewtext:withobject:)]){
        [_rename renamewithnewtext:txtfld4edt.text withobject:objuserinfo];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.alpha=0;
    [txtfld4edt resignFirstResponder];
}

///--------------------------If you use cell in xib the follow below format------------------------------
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CustomeCell4MotrCyclPrf *cell;
//    cell = (CustomeCell4MotrCyclPrf *)[VIBCellDesigner getMtrCyclPrefCell:tableView indexPath:indexPath];
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    return cell;
//}
@end
