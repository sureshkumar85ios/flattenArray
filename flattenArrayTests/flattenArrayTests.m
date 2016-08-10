//
//  flattenArrayTests.m
//  flattenArrayTests
//
//  Created by ADDC on 8/10/16.
//  Copyright © 2016 sureshkumar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+FlattenArrayExtension.h"
@interface flattenArrayTests : XCTestCase

@end

@implementation flattenArrayTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testEmptyArrayFlattening
{
    //Given input
    NSArray *testInputArray =@[];
    //When
    NSArray *testOutputArray = [testInputArray flattenArray];
    //Then
    XCTAssertEqual([testOutputArray count],[testInputArray count],@"Both Array lengths should be equal to zero");
    XCTAssertEqualObjects(testInputArray, testOutputArray,@"Arrays should be equal");
}

- (void)testFlatArrayFlattening
{
    //Given input
    NSArray *testInputArray =@[@1,@2,@3,@4,@5];
    //When
    NSArray *testOutputArray = [testInputArray flattenArray];
    //Then
    XCTAssertEqual([testOutputArray count],[testInputArray count],@"Both Array lengths should be equal to zero");
    XCTAssertEqualObjects(testInputArray, testOutputArray,@"Arrays should be equal");
}

- (void)testRandomlyNestedArrayFlattening
{
    //Given input
    NSArray *testInputArray =@[@[@1, @2, @[@3]], @4];
    NSArray *expectedResultArray = @[@1, @2, @3, @4];

    //When
    NSArray *testOutputArray = [testInputArray flattenArray];
    //Then
    XCTAssertEqualObjects(expectedResultArray, testOutputArray,
                          @"Result array [%@] should be equal to the expected one [%@].",
                          testOutputArray,
                          expectedResultArray
                          );
}
- (void)testOnlyNestedArrayFlattening {
    // Given
    NSArray *testInputArray = @[@[@1], @[@2], @[@3], @[@4]];
    NSArray *expectedResultArray = @[@1, @2, @3, @4];
    // When
    NSArray *testResultArray = [testInputArray flattenArray];
    // Then
    XCTAssertEqualObjects(expectedResultArray, testResultArray,
                          @"Result array [%@] should be equal to the expected one [%@].",
                          testResultArray,
                          expectedResultArray
                          );
}

- (void)testDeeplyNestedArrayFlattening {
    // Given
    NSArray *testInputArray = @[@[@1, @[@2, @[@3, @[@4]]]]];
    NSArray *expectedResultArray = @[@1, @2, @3, @4];
    // When
    NSArray *testResultArray = [testInputArray flattenArray];
    // Then
    XCTAssertEqualObjects(expectedResultArray, testResultArray,
                          @"Result array [%@] should be equal to the expected one [%@].",
                          testResultArray,
                          expectedResultArray
                          );
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        
        NSArray *testInputArray = @[@[@23, @354, @1, @[@7], @[@[@3]]], @[@[@890], @2, @[@[@6], @8]]];
        NSArray *expectedResultArray = @[@23, @354, @1, @7, @3, @890, @2, @6, @8];
        // When
        NSArray *testResultArray = [testInputArray flattenArray];
        // Then
        XCTAssertEqualObjects(expectedResultArray, testResultArray,
                              @"Result array [%@] should be equal to the expected one [%@].",
                              testResultArray,
                              expectedResultArray
                              );
    }];
}

@end
