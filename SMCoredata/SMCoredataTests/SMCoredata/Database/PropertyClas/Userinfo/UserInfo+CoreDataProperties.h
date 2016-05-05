//
//  UserInfo+CoreDataProperties.h
//  SMCoredata
//
//  Created by Shankar Mallick on 29/04/16.
//  Copyright © 2016 Customer First. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "UserInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSSet<ImageUser *> *relationwithimage;

@end

@interface UserInfo (CoreDataGeneratedAccessors)

- (void)addRelationwithimageObject:(ImageUser *)value;
- (void)removeRelationwithimageObject:(ImageUser *)value;
- (void)addRelationwithimage:(NSSet<ImageUser *> *)values;
- (void)removeRelationwithimage:(NSSet<ImageUser *> *)values;

@end

NS_ASSUME_NONNULL_END
