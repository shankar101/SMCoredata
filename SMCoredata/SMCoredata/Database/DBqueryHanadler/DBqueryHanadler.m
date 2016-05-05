//
//  DBqueryHanadler.m
//  SMCoredata
//
//  Created by Shankar Mallick on 29/04/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import "DBqueryHanadler.h"

@implementation DBqueryHanadler
+(DBqueryHanadler *)sharedInstance
{
    static DBqueryHanadler *sharedInstance_ = nil;
    static dispatch_once_t pred;
    
    dispatch_once(&pred, ^{
        sharedInstance_ = [[DBqueryHanadler alloc] init];
        sharedInstance_.appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    });
    return sharedInstance_;
}
#pragma mark----------------------------------
#pragma mark Save In core data
-(void)savedatawithName:(NSString *)_name withimageurl:(NSString *)imgurl withgender:(NSString *)gndr{
    NSString *strcount=[self getcountOfUserwithentotyname:@"UserInfo"];
    NSManagedObjectContext *context = [_appDelegate managedObjectContext];
    UserInfo *obj4UserInfo = (UserInfo*)[NSEntityDescription insertNewObjectForEntityForName:@"UserInfo" inManagedObjectContext:context];
    [obj4UserInfo setUserid:strcount];
    [obj4UserInfo setName:_name];
    [obj4UserInfo setGender:gndr];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"New time:");
        [self saveimagewithimageurl:imgurl withuserobject:obj4UserInfo];
    });
    NSError *error;
    [context save:&error];

}
#pragma mark----------------------------------
#pragma mark Get count from core data
-(NSString *)getcountOfUserwithentotyname:(NSString *)strentityname{

    NSManagedObjectContext *moc = [_appDelegate managedObjectContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:strentityname inManagedObjectContext:moc]];
    
    //1st process
    NSError *error;
    NSInteger countq = [[moc executeFetchRequest:request error:&error] count];
    NSLog(@"%ld",(long)countq);
    
    //OR
    
    // 2nd process
    NSError *err;
    NSUInteger count = [moc countForFetchRequest:request error:&err];
    NSString *strcount;
    if(count == NSNotFound) {
        //Handle error
        strcount=@"1";
        return strcount;
    }
    strcount=[NSString stringWithFormat:@"%u",count+1];
    
    return strcount;
}
#pragma mark----------------------------------
#pragma mark Save In core data
-(void)saveimagewithimageurl:(NSString *)imgurl withuserobject:(UserInfo *)objuserinfo{
    NSString *strcount=[self getcountOfUserwithentotyname:@"ImageUser"];
    NSManagedObjectContext *context = [_appDelegate managedObjectContext];
    ImageUser *obj4ImageUser = (ImageUser*)[NSEntityDescription insertNewObjectForEntityForName:@"ImageUser" inManagedObjectContext:context];
    [obj4ImageUser setImageId:strcount];
    [obj4ImageUser setImageurl:imgurl];
   
    [objuserinfo addRelationwithimageObject:obj4ImageUser];
    NSError *error;
    [context save:&error];
}
#pragma mark----------------------------------
#pragma mark fetch data from core data
-(NSFetchedResultsController *)getDataListwithFilter:(NSString *)gndr
{
    NSManagedObjectContext *moc=[_appDelegate managedObjectContext];;
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    //NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"membername" ascending:YES];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    [fetch setSortDescriptors:@[sortDescriptor]];
    NSEntityDescription *entity =  [NSEntityDescription entityForName:@"UserInfo" inManagedObjectContext:moc];
    [fetch setEntity:entity];
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc] initWithFetchRequest:fetch managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
    NSPredicate *p=[NSPredicate predicateWithFormat:[NSString stringWithFormat:@"gender== '%@'", gndr]];
    [fetch setPredicate:p];
    NSError *error;
    if(![fetched performFetch:&error])
    {
        NSLog(@"error");
    }
    
    NSMutableArray *result = [fetched.fetchedObjects mutableCopy];
    
    if (!result) {
        return nil;
    }
    return fetched;
    
}
#pragma mark----------------------------------
#pragma mark getdata from core data withsorting
-(NSFetchedResultsController *)getDataListwithsrchTxt:(NSString *)srchtxt
{
    NSManagedObjectContext *moc=[_appDelegate managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    //NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"membername" ascending:YES];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    [fetch setSortDescriptors:@[sortDescriptor]];
    NSEntityDescription *entity =  [NSEntityDescription entityForName:@"UserInfo" inManagedObjectContext:moc];
    [fetch setEntity:entity];
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc] initWithFetchRequest:fetch managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
    if(srchtxt.length>0)
    {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ANY name beginswith[cd] %@",srchtxt];//beginswith//CONTAINS[cd]
        [fetch setPredicate:predicate];
    }
    NSError *error;
    if(![fetched performFetch:&error])
    {
        NSLog(@"error");
    }
    
    NSMutableArray *result = [fetched.fetchedObjects mutableCopy];
    
    if (!result) {
        return nil;
    }
    return fetched;
    
}
#pragma mark----------------------------------
#pragma mark delete In core data
-(void)deletedataFrmImgListwithid:(NSString *)listid withname:(NSString *)name
{
    NSManagedObjectContext *moc=[_appDelegate managedObjectContext];
    NSError *error;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity =  [NSEntityDescription entityForName:@"UserInfo" inManagedObjectContext:moc];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userid==%@ AND name==%@", listid,name];
    [request setPredicate:predicate];
    NSLog(@"%@",request);
    NSArray *listOfListToBeDeleted = [moc executeFetchRequest:request error:&error];
    
    //UserInfo *currentList=[listOfListToBeDeleted objectAtIndex:0];
    //[playLstObj removeRltnWithimageObject:currentList];
    for (NSManagedObject *delteselectedImg in listOfListToBeDeleted) {
        [moc deleteObject:delteselectedImg];
    }
    [moc save:&error];
}
#pragma mark----------------------------------
#pragma mark update In core data
-(void)updateNameWithNewname:(NSString *)strname withid:(NSString *)strid{
   
    NSManagedObjectContext *moc=[_appDelegate managedObjectContext];
    NSFetchRequest *fetch = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity =  [NSEntityDescription entityForName:@"UserInfo" inManagedObjectContext:moc];
    [fetch setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    [fetch setSortDescriptors:@[sortDescriptor]];
    NSFetchedResultsController *fetched = [[NSFetchedResultsController alloc] initWithFetchRequest:fetch managedObjectContext:moc sectionNameKeyPath:nil cacheName:nil];
  
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"userid==%@",strid];
    [fetch setPredicate:predicate];
    
    NSError *error;
    if(![fetched performFetch:&error])
    {
        NSLog(@"error");
    }
    
    NSMutableArray *result = [fetched.fetchedObjects mutableCopy];
    if(result.count>0)
    {
        UserInfo *obj=[result objectAtIndex:0];
        [obj setName:strname];
       
        [moc save:&error];
    }
}
@end
