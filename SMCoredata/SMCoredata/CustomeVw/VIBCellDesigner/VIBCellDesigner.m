//
//  VHTCellDesigner.m
//  Vhortext
//
//  Created by Shankar101 on 29/07/15.
//  Copyright (c) 2015 Shankar Mallick. All rights reserved.
//

#import "VIBCellDesigner.h"

@implementation VIBCellDesigner

+(UITableViewCell *) getTableViewCellFromNib:(NSString *)nibName
{
    NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil];
    for (id currentObject in topLevelObjects)
    {
        if ([currentObject isKindOfClass:[UITableViewCell class]])
        {
            return (UITableViewCell *)currentObject;
        }
    }
    return nil;
}


+(CustomeCell4MotrCyclPrf *)getMtrCyclPrefCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    CustomeCell4MotrCyclPrf *cell = (CustomeCell4MotrCyclPrf *)[tableView dequeueReusableCellWithIdentifier:@"CustomeCell4MotrCyclPrf"];
    if (cell == nil)
    {
        cell = (CustomeCell4MotrCyclPrf *)[VIBCellDesigner getTableViewCellFromNib:@"CustomeCell4MotrCyclPrf"];
        
    }
    
    // cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
