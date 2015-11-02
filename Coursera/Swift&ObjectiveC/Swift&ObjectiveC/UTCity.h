//
//  UTCity.h
//  Swift&ObjectiveC
//
//  Created by Andres Kwan on 11/1/15.
//  Copyright © 2015 Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTCity : NSObject
// pointed by a references
// strong, weak, assign is about memory management
@property (nonatomic, strong) NSString *name;
// store in a variable
@property (nonatomic, assign) NSInteger population;
@property (nonatomic, strong, readonly) UTCity *cityWithLargestPopulation;
- (instancetype)initWithName:(NSString *)name population:(NSInteger) population;

@end

@interface UTCountry : NSObject
@property (nonatomic, strong) NSString *name;
//this is an array of nsobjects
@property (nonatomic, strong) NSArray *cities;

- (instancetype)initWithName:(NSString *)name
                      cities:(NSArray *)cities;
- (UTCity *)findCityWIthName:(NSString *)name;
@end