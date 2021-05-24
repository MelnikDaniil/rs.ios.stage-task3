#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    
    NSString *firstSting = [[NSString alloc] initWithString: string1];
        NSString *secondString = [[NSString alloc] initWithString: string2];
        NSMutableString *returnableString = [[NSMutableString alloc] init];
        
        while ([firstSting length] && [secondString length]) {
            const char *first = [firstSting UTF8String];
            const char *second = [secondString UTF8String];
            
            if ((first[0] < second[0]) || (first[0] == second[0])) {
                [returnableString appendString: [firstSting substringToIndex: 1]];
                firstSting = [firstSting substringFromIndex: 1];
            } else {
                [returnableString appendString: [secondString substringToIndex: 1]];
                secondString = [secondString substringFromIndex: 1];
            }
        }
          
        
        if ([firstSting length]) {
            [returnableString appendString: firstSting];
        } else {
            [returnableString appendString: secondString];
        }
        
        
        return returnableString;
}

@end
