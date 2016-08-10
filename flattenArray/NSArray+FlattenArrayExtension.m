//
//  FlattenArray.m
//  flattenArray
//
//  Created by ADDC on 8/10/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import "NSArray+FlattenArrayExtension.h"

@implementation NSArray(FlattenArrayExtension)

- (NSArray *)flattenArray
{
    NSMutableArray *flatternArray = [NSMutableArray array];
    
    [self m_flatten:self to:flatternArray];
    
#if __has_feature(objc_arc)
    return [flatternArray copy];
#else
    return [[flattenedArray copy] autorelease];
#endif
    
}

- (void)m_flatten:(NSArray *)sourceArray to:(NSMutableArray *)flattenArray {
    
    if (nil == flattenArray) {
        
        return;
    }
    
    for (id object in sourceArray) {
        
        
        if([object isKindOfClass:[NSArray class]]) {
            
            NSArray *sourceArrayObject = (NSArray *)object;
            
            [self m_flatten:sourceArrayObject to:flattenArray];
            
        }
        else {
            
            [flattenArray addObject:object];
        }
    }
}
@end
