/* MissingInteger
    - Time: 18min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/

#import <Foundation/NSDictionary.h>

int solution(NSMutableArray *A) {
    NSMutableDictionary* seq = [NSMutableDictionary new];
    for (int i=0; i<=A.count; i++) {
        seq[@(i+1)] = @(i+1);
    }
    
    for (int i=0; i<A.count; i++) {
        [seq removeObjectForKey:A[i]];
    }
    
    NSNumber* min = nil;
    for (NSNumber* key in seq) {
        if (min == nil || ([seq[key] intValue] < [min intValue] && [seq[key] intValue] > 0))
            min = seq[key];
    }
    
    return [min intValue];
}