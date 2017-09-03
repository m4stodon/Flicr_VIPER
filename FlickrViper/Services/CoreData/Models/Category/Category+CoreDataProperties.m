//
//  Category+CoreDataProperties.m
//  
//
//  Created by Ermac on 9/3/17.
//
//

#import "Category+CoreDataProperties.h"

@implementation Category (CoreDataProperties)

+ (NSFetchRequest<Category *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Category"];
}

@dynamic title;

@end
