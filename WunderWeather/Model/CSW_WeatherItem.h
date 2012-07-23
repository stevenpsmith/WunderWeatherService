//
//  CSW_WeatherItem.h
//  WunderWeather
//
//  Created by Steve Smith on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSW_WeatherItem : NSObject

@property (nonatomic, strong) NSString *weatherDate;
@property (nonatomic, strong) NSString *weatherText;
@property (nonatomic, strong) NSString *highTemp;
@property (nonatomic, strong) NSString *lowTemp;
@property (nonatomic, strong) NSURL *iconURL;

- (id) initWithItemDictionary:(NSDictionary *)itemDictionary;

@end
