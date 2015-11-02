//
//  UTCity.m
//  Swift&ObjectiveC
//
//  Created by Andres Kwan on 11/1/15.
//  Copyright © 2015 Kwan. All rights reserved.
//

#import "UTCity.h"

@implementation UTCity
- (instancetype)initWithName:(NSString *)name population:(NSInteger) population
{
    self = [super init];
    if (self) {
        self.name = name;
        self.population = population;
    }
    return self;
}
@end


@implementation UTCountry

- (instancetype)initWithName:(NSString *)name
                      cities:(NSArray *)cities{
    self = [super init];
    if (self) {
        self.name = name;
        self.cities = cities;
    }
    return self;
    
}

// Here is not explicit that the function may return nil
- (UTCity *)findCityWIthName:(NSString *)name{
    for (UTCity * city in self.cities) {
        //here needs this function isEqualToString
        // == compare the reference's addresses
        if ([city.name isEqualToString:name]) {
            return city;
        }
    }
    return nil;
}

//Properties
-(UTCity *)cityWithLargestPopulation {
    NSInteger maxPopulation = 0;
    UTCity * largestCity = self.cities[0];
    for (UTCity * city in self.cities) {
        if (city.population > maxPopulation) {
            maxPopulation = city.population;
            largestCity = city;
        }
    }
    return largestCity;
}

@end