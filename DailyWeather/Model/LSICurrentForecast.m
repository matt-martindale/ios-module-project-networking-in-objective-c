//
//  LSICurrentForecast.m
//  DailyWeather
//
//  Created by Matthew Martindale on 7/28/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSICurrentForecast.h"

@implementation LSICurrentForecast

- (instancetype)initWithTime: (NSDate *)time
                     summary: (NSString *)summary
                        icon: (NSString *)icon
           precipProbability: (int)precipProbability
             precipIntensity: (double)precipIntensity
                 temperature: (double)temperature
         apparentTemperature: (double)apparentTemperature
                    humidity: (double)humidity
                    pressure: (double)pressure
                   windSpeed: (double)windSpeed
                 windBearing: (int)windBearing
                     uvIndex: (int)uvIndex
{
    if (self = [super init]) {
        _time = time;
        _summary = summary.copy;
        _icon = icon.copy;
        _precipProbability = precipProbability;
        _precipIntensity = precipIntensity;
        _temperature = temperature;
        _apparentTemperature = apparentTemperature;
        _humidity = humidity;
        _pressure = pressure;
        _windSpeed = windSpeed;
        _windBearing = windBearing;
        _uvIndex = uvIndex;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    // required
    NSNumber *timeInMilliseconds = [dictionary objectForKey:@"time"];
    if (![timeInMilliseconds isKindOfClass:NSNumber.class]) return nil;
    
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeInMilliseconds.longValue/1000.];
    
    // optional
    NSString *summary = [dictionary objectForKey:@"summary"];
    if ([summary isKindOfClass:NSNull.class]) summary = nil;
    else if (![summary isKindOfClass:NSString.class]) return nil;
    
    // optional
    NSString *icon = [dictionary objectForKey:@"icon"];
    if ([icon isKindOfClass:NSNull.class]) icon = nil;
    else if (![icon isKindOfClass:NSString.class]) return nil;
    
    // optional
    NSNumber *precipProbability = [dictionary objectForKey:@"precipProbability"];
    if ([precipProbability isKindOfClass:NSNull.class]) precipProbability = nil;
    else if (![precipProbability isKindOfClass:NSNumber.class]) return nil;
    
    // optional
    NSNumber *precipIntensity = [dictionary objectForKey:@"precipIntensity"];
    if ([precipIntensity isKindOfClass:NSNull.class]) precipIntensity = nil;
    else if (![precipIntensity isKindOfClass:NSNumber.class]) return nil;
    
    // optional on hourly and currently
    NSNumber *temperature = [dictionary objectForKey:@"temperature"];
    if ([temperature isKindOfClass:[NSNull class]]) temperature = nil;
    else if (![temperature isKindOfClass:[NSNumber class]]) return nil;
    
    // optional on hourly and currently
    NSNumber *apparentTemperature = [dictionary objectForKey:@"apparentTemperature"];
    if ([apparentTemperature isKindOfClass:[NSNull class]]) apparentTemperature = nil;
    else if (![apparentTemperature isKindOfClass:[NSNumber class]]) return nil;
    
    // optional
    NSNumber *humidity = [dictionary objectForKey:@"humidity"];
    if ([humidity isKindOfClass:[NSNull class]]) humidity = nil;
    else if (![humidity isKindOfClass:[NSNumber class]]) return nil;
    
    // optional
    NSNumber *pressure = [dictionary objectForKey:@"pressure"];
    if ([pressure isKindOfClass:[NSNull class]]) pressure = nil;
    else if (![pressure isKindOfClass:[NSNumber class]]) return nil;
    
    // optional
    NSNumber *windSpeed = [dictionary objectForKey:@"windSpeed"];
    if ([windSpeed isKindOfClass:[NSNull class]]) windSpeed = nil;
    else if (![windSpeed isKindOfClass:[NSNumber class]]) return nil;
    
    // optional
    NSNumber *windBearing = [dictionary objectForKey:@"windBearing"];
    if ([windBearing isKindOfClass:[NSNull class]]) windBearing = nil;
    else if (![windBearing isKindOfClass:[NSNumber class]]) return nil;
    
    // optional
    NSNumber *uvIndex = [dictionary objectForKey:@"uvIndex"];
    if ([uvIndex isKindOfClass:[NSNull class]]) uvIndex = nil;
    else if (![uvIndex isKindOfClass:[NSNumber class]]) return nil;
    
    return [self initWithTime:time
                      summary:summary
                         icon:icon
            precipProbability:precipProbability.intValue
              precipIntensity:precipIntensity.doubleValue
                  temperature:temperature.doubleValue
          apparentTemperature:apparentTemperature.doubleValue
                     humidity:humidity.doubleValue
                     pressure:pressure.doubleValue
                    windSpeed:windSpeed.doubleValue
                  windBearing:windBearing.intValue
                      uvIndex:uvIndex.intValue];
}

@end
