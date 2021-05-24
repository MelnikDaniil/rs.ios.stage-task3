#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    if ([ratingArray count] < 3) {
            return 0;
        }
        
        NSMutableArray *firstTeam;
        NSMutableArray *lastTeam;
        NSMutableSet *finalTeam = [NSMutableSet new];
        
        for (int i = 0; i < [ratingArray count] - 2; i++) {
            
            firstTeam = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
            lastTeam = [[NSMutableArray alloc] initWithObjects:ratingArray[i], nil];
            
            for (int j = i+1; j < [ratingArray count]; j++) {
                if ([firstTeam count] > 1) {
                    [firstTeam removeLastObject];
                }
                
                if ([lastTeam count] > 1) {
                    [lastTeam removeLastObject];
                }
                
                if ([ratingArray[j] intValue] > [[firstTeam lastObject] intValue]) {
                    [firstTeam addObject:[ratingArray objectAtIndex:j]];
                } else if ([[ratingArray objectAtIndex:j] intValue] < [[lastTeam lastObject] intValue]) {
                    [lastTeam addObject:[ratingArray objectAtIndex:j]];
                }
                
                for (int k = j+1; k < [ratingArray count]; k++) {
                    if ([ratingArray[k] intValue] > [[firstTeam lastObject] intValue]) {
                        [firstTeam addObject:[ratingArray objectAtIndex:k]];
                    } else if ([[ratingArray objectAtIndex:k] intValue] < [[lastTeam lastObject] intValue]) {
                        [lastTeam addObject:[ratingArray objectAtIndex:k]];
                    }
                    
                    if ([firstTeam count] > 2) {
                        [finalTeam addObject: [[firstTeam valueForKey:@"description"] componentsJoinedByString:@""]];
                        [firstTeam removeLastObject];
                    }
                    
                    if ([lastTeam count] > 2) {
                        [finalTeam addObject: [[lastTeam valueForKey:@"description"] componentsJoinedByString:@""]];
                        [lastTeam removeLastObject];
                    }
                    
                }
                
            }
        }
        return [finalTeam count];
}

@end
