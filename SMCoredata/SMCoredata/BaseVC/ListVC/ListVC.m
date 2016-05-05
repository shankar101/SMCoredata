//
//  ListVC.m
//  SMCoredata
//
//  Created by Shankar Mallick on 02/05/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import "ListVC.h"
#define Male @"Male"
#define Female @"Female"

@interface ListVC ()

@end

@implementation ListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSFetchedResultsController * fetched=[[DBqueryHanadler sharedInstance] getDataListwithFilter:Male];
    arrList=[fetched.fetchedObjects mutableCopy];
    [tblVw4datalist reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - TableView Datasource & Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 73;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    UITableViewCell *cell   =   [tableView dequeueReusableCellWithIdentifier:@"_identifireDtalist"];
    UserInfo *objuserinfo   =   [arrList objectAtIndex:indexPath.row];
    UILabel *lbl4Nm         =   (UILabel *)[cell.contentView viewWithTag:102];
    lbl4Nm.text             =   objuserinfo.name;
    UILabel *gndr           =   (UILabel *)[cell.contentView viewWithTag:103];
    gndr.text               =   [NSString stringWithFormat:@"Gender %@",objuserinfo.gender];
    UIImageView *imgVw      =   (UIImageView *)[cell.contentView viewWithTag:101];
    NSArray *sortDscriptors =  [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"imgpriorityId" ascending:YES]];
    NSArray *arr4imgList    =   [[objuserinfo.relationwithimage allObjects] sortedArrayUsingDescriptors:sortDscriptors];
    ImageUser *objimgusr;
    
    if(arr4imgList.count>0){
        objimgusr=[arr4imgList objectAtIndex:0];
    }
    imgVw.layer.cornerRadius = imgVw.frame.size.height/2;
    imgVw.layer.masksToBounds = YES;
    //----------------------------------------------------------------------------------------------------------
    //Use Libery image Downloader
    
    //[imgVw setImageWithURL:[NSURL URLWithString: objimgusr.imageurl ]placeholderImage:[UIImage imageNamed:@"EditIcon"] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //    [imgVw setImageWithURL:[NSURL URLWithString: objimgusr.imageurl ] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    //        NSLog(@"");
    //    } usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    //-----------------------------------------------------------------------------------------------------------
    
    //[imgVw sd_setImageWithURL:[NSURL URLWithString:objimgusr.imageurl] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    [imgVw sd_setImageWithURL:[NSURL URLWithString:objimgusr.imageurl]
                 placeholderImage:[UIImage imageNamed:@"placeholder"]
                          options:SDWebImageRefreshCached];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (IBAction)backtoprevious:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)switchChange:(id)sender {
    BOOL state = [sender isOn];
    NSFetchedResultsController * fetched;
    if(state){
        fetched=[[DBqueryHanadler sharedInstance] getDataListwithFilter:Male];
        
    }else{
        fetched=[[DBqueryHanadler sharedInstance] getDataListwithFilter:Female];
    }
    arrList=[fetched.fetchedObjects mutableCopy];
    [tblVw4datalist reloadData];
}
@end
