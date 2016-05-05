//
//  ImageUser+CoreDataProperties.h
//  SMCoredata
//
//  Created by Shankar Mallick on 21/04/16.
//  Copyright © 2016 Customer First. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ImageUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageUser (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *imageId;
@property (nullable, nonatomic, retain) NSString *imageurl;

@end

NS_ASSUME_NONNULL_END
