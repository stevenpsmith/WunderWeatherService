//
//  CSW_WunderWeatherService.h
//  WunderWeather
//
//  Created by Steve Smith on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSW_WunderWeatherService : NSObject

+ (void)retrieveWeatherForecastForZipCode:(NSString *)zipCode withBlock:(void (^)(NSArray *weatherItems))block;

@end
