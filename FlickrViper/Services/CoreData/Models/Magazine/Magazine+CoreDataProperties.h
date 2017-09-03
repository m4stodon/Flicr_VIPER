//
//  Magazine+CoreDataProperties.h
//  
//
//  Created by Ermac on 9/3/17.
//
//

#import "Magazine+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Magazine (CoreDataProperties)

+ (NSFetchRequest<Magazine *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *details;
@property (nonatomic) int32_t views;
@property (nullable, nonatomic, copy) NSDate *creationDate;
@property (nullable, nonatomic, copy) NSString *image;
@property (nullable, nonatomic, retain) NSSet<Category *> *category;

@end

@interface Magazine (CoreDataGeneratedAccessors)

- (void)addCategoryObject:(Category *)value;
- (void)removeCategoryObject:(Category *)value;
- (void)addCategory:(NSSet<Category *> *)values;
- (void)removeCategory:(NSSet<Category *> *)values;

@end

NS_ASSUME_NONNULL_END
