//
//  CSW_WunderWeatherService.m
//  WunderWeather
//
//  Created by Steve Smith on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CSW_WunderWeatherService.h"
#import "CSW_WunderWeatherHTTPClient.h"
#import "CSW_WeatherItem.h"

@implementation CSW_WunderWeatherService

static NSString * const kYQLQuery = @" SELECT * FROM wunderground.forecast WHERE location='%@'";
static NSString * const kEnvStore = @"store://datatables.org/alltableswithkeys";

+ (void)retrieveWeatherForecastForZipCode:(NSString *)zipCode withBlock:(void (^)(NSArray *weatherItems))block {
    NSMutableArray *weatherItems = [[NSMutableArray alloc] init];
    NSString *query = [NSString stringWithFormat:kYQLQuery, zipCode];
    NSDictionary *paramsDict = [NSDictionary dictionaryWithObjectsAndKeys:query, @"q", @"json", @"format", kEnvStore, @"env", nil];
    
    [[CSW_WunderWeatherHTTPClient sharedClient] getPath:@"" parameters:paramsDict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *query = [responseObject objectForKey:@"query"];
        NSDictionary *results = [query objectForKey:@"results"];
        NSDictionary *forecast = [results objectForKey:@"forecast"];
        NSDictionary *simpleForecast = [forecast objectForKey:@"simpleforecast"];
        NSArray *forecastday = [simpleForecast objectForKey:@"forecastday"];
        for (NSDictionary *item in forecastday){
            CSW_WeatherItem *weatherItem = [[CSW_WeatherItem alloc] initWithItemDictionary:item];
            [weatherItems addObject:weatherItem];
        }
        if (block){
            block([NSArray arrayWithArray:weatherItems]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    }];
}

@end
