//
//  CSW_WunderWeahterHTTPClient.h
//  WunderWeather
//
//  Created by Steve Smith on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AFHTTPClient.h"

@interface CSW_WunderWeatherHTTPClient : AFHTTPClient

+ (CSW_WunderWeatherHTTPClient *)sharedClient;

@end
