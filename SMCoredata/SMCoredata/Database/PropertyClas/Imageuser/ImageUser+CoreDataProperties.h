//
//  ImageUser+CoreDataProperties.h
//  SMCoredata
//
//  Created by Shankar Mallick on 04/05/16.
//  Copyright © 2016 Shankar101. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ImageUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *imageId;
@property (nullable, nonatomic, retain) NSString *imageurl;
@property (nullable, nonatomic, retain) UserInfo *userinfo;

@end

NS_ASSUME_NONNULL_END
