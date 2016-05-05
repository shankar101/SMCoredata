//
//  DBqueryHanadler.h
//  SMCoredata
//
//  Created by Shankar Mallick on 29/04/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInfo.h"
#import "ImageUser.h"
#import "AppDelegate.h"

@interface DBqueryHanadler : NSObject{
    
}
@property (nonatomic, strong) AppDelegate *appDelegate;

+(DBqueryHanadler *)sharedInstance;
-(void)savedatawithName:(NSString *)_name withimageurl:(NSString *)imgurl withgender:(NSString *)gndr;
-(NSFetchedResultsController *)getDataListwithFilter:(NSString *)gndr;
-(NSFetchedResultsController *)getDataListwithsrchTxt:(NSString *)srchtxt;
-(void)deletedataFrmImgListwithid:(NSString *)listid withname:(NSString *)name;
-(void)updateNameWithNewname:(NSString *)strname withid:(NSString *)strid;
@end
