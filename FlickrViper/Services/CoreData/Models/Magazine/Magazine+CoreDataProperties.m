//
//  Magazine+CoreDataProperties.m
//  
//
//  Created by Ermac on 9/3/17.
//
//

#import "Magazine+CoreDataProperties.h"

@implementation Magazine (CoreDataProperties)

+ (NSFetchRequest<Magazine *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Magazine"];
}

@dynamic title;
@dynamic details;
@dynamic views;
@dynamic creationDate;
@dynamic image;
@dynamic category;

@end
