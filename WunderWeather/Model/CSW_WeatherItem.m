//
//  CSW_WeatherItem.m
//  WunderWeather
//
//  Created by Steve Smith on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CSW_WeatherItem.h"

@implementation CSW_WeatherItem

@synthesize weatherDate;
@synthesize weatherText;
@synthesize highTemp;
@synthesize lowTemp;
@synthesize iconURL;

- (id) initWithItemDictionary:(NSDictionary *)itemDictionary {
    self = [super init];
    
    NSDictionary *dateDict = [itemDictionary objectForKey:@"date"];
    NSString *dateString = [NSString stringWithFormat:@"%@ %@ %@", [dateDict objectForKey:@"day"], [dateDict objectForKey:@"monthname"], [dateDict objectForKey:@"year"]];
    [self setWeatherDate:dateString];
    
    [self setWeatherText:[itemDictionary objectForKey:@"conditions"]];
    
    NSDictionary *highDict = [itemDictionary objectForKey:@"high"];
    [self setHighTemp:[highDict objectForKey:@"fahrenheit"]];
    
    NSDictionary *lowDict = [itemDictionary objectForKey:@"low"];
    [self setLowTemp:[lowDict objectForKey:@"fahrenheit"]];
    
    NSDictionary *iconDict = [itemDictionary objectForKey:@"icons"];
    NSArray *iconSet = [iconDict objectForKey:@"icon_set"];
    for (NSDictionary *icon in iconSet){
        if ([[icon objectForKey:@"name"] isEqualToString:@"Mobile"]){
            [self setIconURL:[NSURL URLWithString:[icon objectForKey:@"icon_url"]]];
            break;
        }
    }
    
    return self;
}

- (NSString *)description {
    NSMutableString *descr = [[NSMutableString alloc] init];
    [descr appendString:[NSString stringWithFormat:@"weatherDate: %@", [self weatherDate]]];
    [descr appendString:[NSString stringWithFormat:@"\rweatherText: %@", [self weatherText]]];
    [descr appendString:[NSString stringWithFormat:@"\rhigh: %@", [self highTemp]]];
    [descr appendString:[NSString stringWithFormat:@"\rlow: %@", [self lowTemp]]];
    return [NSString stringWithString:descr];
}

- (void)dealloc {
    [self setWeatherDate:nil];
    [self setWeatherText:nil];
    [self setHighTemp:nil];
    [self setLowTemp:nil];
}


@end
