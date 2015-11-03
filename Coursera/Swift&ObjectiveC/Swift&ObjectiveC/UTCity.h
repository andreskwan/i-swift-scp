//
//  UTCity.h
//  Swift&ObjectiveC
//
//  Created by Andres Kwan on 11/1/15.
//  Copyright © 2015 Kwan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UTCity : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger population;

- (instancetype)initWithName:(NSString *)name population:(NSInteger) population;
@end

@interface UTCountry : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong, readonly) UTCity *cityWithLargestPopulation;

- (instancetype)initWithName:(NSString *)name
                      cities:(NSArray *)cities;

- (UTCity *)findCityWIthName:(NSString *)name;
@end