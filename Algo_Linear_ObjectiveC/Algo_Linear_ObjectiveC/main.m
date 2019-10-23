//
//  main.m
//  Algo_Linear_ObjectiveC
//
//  Created by Venkateswara Meda on 23/10/19.
//  Copyright © 2019 VRMDev2017. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlgorithmSearch : NSObject
-(int)oneDimensionLinearSearch: (NSArray *) arr searchingElement: (int) ele;
-(NSDictionary *)multiDimensionLinearSearch: (NSArray *) arr searchingElement: (int) ele;
@end

@implementation AlgorithmSearch

-(id)init {
    self = [super init];
    return self;
}

// 1-D Linear Search Algoithm
-(int)oneDimensionLinearSearch: (NSArray *) arr searchingElement: (int) ele {
    
    // We have take the algorithm and loop all the elements.
    // For linear search the complexity is O(n*m). Here m = 1(1 dimention array) and n = number of elements in the array.
    
    for (int obj = 0; obj < arr.count; obj++) {
        int value = [arr[obj] intValue];
        if (ele == value ) {
            return obj;
        }
    }
    return -1;
}

// M-D Linear Search Algoithm
-(NSDictionary *)multiDimensionLinearSearch: (NSArray *) arr searchingElement: (int) ele {
    
    // We have take the algorithm and loop all the elements.
    // For linear search the complexity is O(n*m). Here m = 2(2 dimention array) and n = number of elements in the array.
    
    for (int obj1 = 0; obj1 < arr.count; obj1++) {
        NSArray *subArr = arr[obj1] ;
        for (int obj2 = 0; obj2 < subArr.count; obj2++) {
            int value = [subArr[obj2] intValue];
            if (ele == value ) {
                
               // NSDictionary cannot store scalar values (like BOOL, NSInteger, etc.), it can store only objects. You must wrap your scalar values into NSNumber to store them:
                NSDictionary *dic = [[NSDictionary alloc]initWithObjectsAndKeys: [NSNumber numberWithInt:obj2], @"SubArrayPositioin", [NSNumber numberWithInt:obj1], @"Position", nil];
                return dic;
            }
        }
    }
    
    return nil;
}
@end


int main() {
    @autoreleasepool {
        NSArray *elementsArray = @[@30,@40,@80,@70];
        int searchingElement = 80;
        
        AlgorithmSearch * algoSearch = [[AlgorithmSearch alloc] init];
        int index = [algoSearch oneDimensionLinearSearch:elementsArray searchingElement:searchingElement];
        NSLog(@"%d",index);
        
        
        NSArray *elementsArray2 = @[@[@1, @2], @[@10, @20], @[@100, @200], @[@1000, @2000]];
        int searchingElement2 = 1000;
        
        NSDictionary *indexDic = [algoSearch multiDimensionLinearSearch:elementsArray2 searchingElement:searchingElement2];
        NSLog(@"%@",indexDic);
    }
}
