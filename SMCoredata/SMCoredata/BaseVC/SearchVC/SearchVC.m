//
//  SearchVC.m
//  SMCoredata
//
//  Created by Shankar Mallick on 03/05/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//

#import "SearchVC.h"
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

@interface SearchVC ()

@end

@implementation SearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSFetchedResultsController * fetched=[[DBqueryHanadler sharedInstance] getDataListwithsrchTxt:@""];
    arrsrchList=[fetched.fetchedObjects mutableCopy];
    [tblVw4srchlist reloadData];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setUpView];
}

#pragma mark-----------------------------
#pragma mark Customevw load in VC

-(void)setUpView
{
    [self.view addSubview:self.conversationView4PopupVwRename];
    [self setUpCenversationViewConstraints4PopupVwRename];
    _popupRename.alpha=0;
}
-(PopupVwRename *)conversationView4PopupVwRename
{
    if (!_popupRename) {
        _popupRename = [PopupVwRename instantiateFromNib];
        [_popupRename setTranslatesAutoresizingMaskIntoConstraints:NO];
        _popupRename._rename = self;
        //[_popupRename loadxibwithvalue];
    }
    return _popupRename;
}
-(void)setUpCenversationViewConstraints4PopupVwRename
{
    NSDictionary *views = @{@"conversationView": self.conversationView4PopupVwRename};
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(==0)-[conversationView]-(==0)-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==0)-[conversationView]-(==0)-|" options:0 metrics:nil views:views]];
    
    [self.view layoutIfNeeded];
    [self.view setNeedsUpdateConstraints];
}


#pragma mark---------------------------------------------------

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
    return [arrsrchList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return 45;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell   =   [tableView dequeueReusableCellWithIdentifier:@"_identifiresrchlist"];
    UserInfo *objuserinfo   =   [arrsrchList objectAtIndex:indexPath.row];
    UILabel *lbl4Nm         =   (UILabel *)[cell.contentView viewWithTag:102];
    lbl4Nm.text             =   objuserinfo.name;
    
    UIButton *btndlt        =   (UIButton *)[cell.contentView viewWithTag:121];
    [btndlt addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btnedit        =   (UIButton *)[cell.contentView viewWithTag:122];
    [btnedit addTarget:self action:@selector(edit:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
}



#pragma mark----------------------
#pragma mark Search delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self performSelector:@selector(serchListDependOnUsrInput) withObject:nil afterDelay:0.1];
}
-(void)serchListDependOnUsrInput
{
    
    NSFetchedResultsController * fetched=[[DBqueryHanadler sharedInstance] getDataListwithsrchTxt:srchbr.text];
    arrsrchList=[fetched.fetchedObjects mutableCopy];
    
    [tblVw4srchlist reloadData];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}
#pragma mark -------------------
#pragma mark keyBoard notification

- (void)keyboardWillShow:(NSNotification *)notification{
    tblVw4srchlist.scrollEnabled=YES;
    NSDictionary *userInfo = [notification userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    tblVw4srchlist.contentInset=UIEdgeInsetsMake(0, 0, kbSize.height, 0);
}
-(void)keyboardWillHide:(NSNotification *)note{
    tblVw4srchlist.contentInset=UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark---------------------------------------
#pragma mark button ACtion

-(IBAction)delete:(id)sender{
    UITableViewCell *Cell;
    UIButton *btn = (UIButton *)sender;
    
    if (SYSTEM_VERSION>=7.0  && SYSTEM_VERSION<8.0) {
       Cell = (UITableViewCell *) btn.superview.superview.superview;
    } else {
       Cell = (UITableViewCell *) btn.superview.superview;
    }
    
    NSIndexPath *indexPath  = [tblVw4srchlist indexPathForCell:Cell];
    NSLog(@"%ldfgg",(long)indexPath.section);
    UserInfo *obj           = [arrsrchList objectAtIndex:indexPath.row];
    [[DBqueryHanadler sharedInstance] deletedataFrmImgListwithid:obj.userid withname:obj.name];
    [self showalertWithMessage:@"Successfully delete."];
   
    
}
-(IBAction)edit:(id)sender{
    UITableViewCell *Cell;
    UIButton *btn   =   (UIButton *)sender;
    
    if (SYSTEM_VERSION>=7.0  && SYSTEM_VERSION<8.0) {
        Cell  = (UITableViewCell *) btn.superview.superview.superview;
    } else {
        Cell  = (UITableViewCell *) btn.superview.superview;
    }
    
    NSIndexPath *indexPath  = [tblVw4srchlist indexPathForCell:Cell];
    NSLog(@"%ldfgg",(long)indexPath.section);
    UserInfo *obj           = [arrsrchList objectAtIndex:indexPath.row];
    _popupRename.strname    = obj.name;
    _popupRename.alpha=1;
    [_popupRename loadxibwithvaluewithuserobject:obj];

}
- (IBAction)backtoprevious:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma -------------------------------------------
#pragma Alert Method
-(void)showalertWithMessage:(NSString *)strMsg{
    
    UIAlertController *alertController  = [UIAlertController alertControllerWithTitle:@"SMCoreData" message:strMsg
                                             preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction             = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action") style:
                                          UIAlertActionStyleDefault
                                          handler:^(UIAlertAction *action)
                                           {
                                               NSLog(@"OK action");
                                               NSFetchedResultsController * fetched=[[DBqueryHanadler sharedInstance] getDataListwithsrchTxt:@""];
                                               arrsrchList=[fetched.fetchedObjects mutableCopy];
                                               [tblVw4srchlist reloadData];
                                           }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark------------------------------
#pragma mark rename delegate
-(void)renamewithnewtext:(NSString *)strtxt withobject:(UserInfo *)objuserinfo{
    [[DBqueryHanadler sharedInstance] updateNameWithNewname:strtxt withid:objuserinfo.userid];
    _popupRename.alpha=0;
    [self showalertWithMessage:@"Update successfully."];
}
@end
