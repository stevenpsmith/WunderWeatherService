//
//  CSY_WeatherListViewController.m
//  YahooWeather
//
//  Created by Steve Smith on 7/20/12.
//  Copyright (c) 2012 Steve Smith. All rights reserved.
//

#import "CSW_WeatherListViewController.h"
#import "CSW_WunderWeatherService.h"
#import "CSW_WeatherItemCell.h"

@interface CSW_WeatherListViewController ()

@property (nonatomic, strong) NSArray *weatherItems;

@end

@implementation CSW_WeatherListViewController
@synthesize table = _table;
@synthesize lblTitle = _lblTitle;
@synthesize zipCode = _zipCode;

@synthesize  weatherItems = _weatherItems;

- (id) initWithZipCode:(NSString *)zipCode {
    self = [super init];
    [self setZipCode:zipCode];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self lblTitle] setText:[NSString stringWithFormat:@"Wunderground Weather for %@", [self zipCode]]];
    
    [CSW_WunderWeatherService retrieveWeatherForecastForZipCode:[self zipCode] withBlock:^(NSArray *weatherItems) {
        [self setWeatherItems:weatherItems];
        [[self table] reloadData];
    }];
}

- (void)viewDidUnload
{
    [self setTable:nil];
    [self setLblTitle:nil];
    [self setWeatherItems:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_weatherItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellId = @"WeatherItemCell";
    CSW_WeatherItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    if (!cell){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CSW_WeatherItemCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    CSW_WeatherItem *weatherItem = [[self weatherItems] objectAtIndex:[indexPath row]];
    [cell setWeatherItem:weatherItem];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 64.0f;
}


@end
