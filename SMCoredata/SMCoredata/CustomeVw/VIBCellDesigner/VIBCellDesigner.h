//
//  VHTCellDesigner.h
//  Vhortext
//
//  Created by Shankar101 on 29/07/15.
//  Copyright (c) 2015 Shankar Mallick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomeCell4MotrCyclPrf.h"

@interface VIBCellDesigner : NSObject

+(UITableViewCell *) getTableViewCellFromNib:(NSString *)nibName;

+(CustomeCell4MotrCyclPrf *)getMtrCyclPrefCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
