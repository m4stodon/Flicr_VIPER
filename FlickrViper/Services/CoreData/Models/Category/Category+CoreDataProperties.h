//
//  Category+CoreDataProperties.h
//  
//
//  Created by Ermac on 9/3/17.
//
//

#import "Category+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Category (CoreDataProperties)

+ (NSFetchRequest<Category *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *title;

@end

NS_ASSUME_NONNULL_END
