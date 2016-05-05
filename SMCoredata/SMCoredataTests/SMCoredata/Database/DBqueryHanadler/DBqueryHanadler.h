//
//  DBqueryHanadler.h
//  SMCoredata
//
//  Created by Shankar Mallick on 29/04/16.
//  Copyright © 2016 Customer First. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "ImageUser.h"

@interface DBqueryHanadler : NSObject
+(DBqueryHanadler *)sharedInstance;
-(void)savedatawithName:(NSString *)_name withimageurl:(NSString *)imgurl withgender:(NSString *)gndr;
@end
