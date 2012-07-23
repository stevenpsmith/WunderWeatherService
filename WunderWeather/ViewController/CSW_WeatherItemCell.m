//
//  CSY_WeatherItemCell.m
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "CSW_WeatherItemCell.h"
#import "UIImageView+AFNetworking.h"

@implementation CSW_WeatherItemCell
@synthesize lblDate;
@synthesize lblText;
@synthesize lblLow;
@synthesize lblHigh;
@synthesize imgIcon;

@synthesize weatherItem = _weatherItem;


- (void) setWeatherItem:(CSW_WeatherItem *)weatherItem {
    _weatherItem = nil;
    _weatherItem = weatherItem;
    [[self lblDate] setText:[weatherItem weatherDate]];
    [[self lblText] setText:[weatherItem weatherText]];
    [[self lblHigh] setText:[weatherItem highTemp]];
    [[self lblLow] setText:[weatherItem lowTemp]];
    [[self imgIcon] setImageWithURL:[weatherItem iconURL]];
}

- (void) dealloc {
    [self setWeatherItem:nil];
}

@end
