//
//  CSW_WunderWeahterHTTPClient.m
//  WunderWeather
//
//  Created by Steve Smith on 7/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CSW_WunderWeatherHTTPClient.h"
#import "AFJSONRequestOperation.h"

@implementation CSW_WunderWeatherHTTPClient

static NSString * const kYahooBaseURL = @"http://query.yahooapis.com/v1/public/yql";

+ (CSW_WunderWeatherHTTPClient *)sharedClient {
    static CSW_WunderWeatherHTTPClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[CSW_WunderWeatherHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:kYahooBaseURL]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}


@end
