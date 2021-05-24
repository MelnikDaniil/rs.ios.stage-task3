#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {

    if ((monthNumber < 1) || (monthNumber > 12)) {
        return nil;
    } else {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        NSString *monthName = [[dateFormatter monthSymbols] objectAtIndex:(monthNumber-1)];
        return monthName;
    }
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSString *fish = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = fish;
    NSDate *dateFromSting = [dateFormatter dateFromString:date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    long returnableDate = [calendar component:NSCalendarUnitDay fromDate:dateFromSting];
    
    return returnableDate;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale: [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    NSInteger day = [calendar component:NSCalendarUnitWeekday fromDate:date];
    while (day) {
            return [[dateFormatter shortWeekdaySymbols] objectAtIndex:day - 1];
        }
    return nil;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];

        NSInteger returnableWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:date];
        NSInteger currentWeek = [calendar component:NSCalendarUnitWeekOfYear fromDate:[NSDate now]];
    if(returnableWeek == currentWeek) {
            return YES;
        } else {
            return NO;
        }
    
}

@end
