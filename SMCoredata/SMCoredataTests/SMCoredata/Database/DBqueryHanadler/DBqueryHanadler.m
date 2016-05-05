//
//  DBqueryHanadler.m
//  SMCoredata
//
//  Created by Shankar Mallick on 29/04/16.
//  Copyright © 2016 Customer First. All rights reserved.
//

#import "DBqueryHanadler.h"

@implementation DBqueryHanadler
+(DBqueryHanadler *)sharedInstance
{
    static DBqueryHanadler *sharedInstance_ = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance_ = [[DBqueryHanadler alloc] init];
    });
    return sharedInstance_;
}
-(void)savedatawithName:(NSString *)_name withimageurl:(NSString *)imgurl withgender:(NSString *)gndr{


}
@end
