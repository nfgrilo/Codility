/* FrogRiverOne
  	- Time: 22min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/

#import <Foundation/NSDictionary.h>

int solution(int X, NSMutableArray *A) {
    NSMutableDictionary *needed = [NSMutableDictionary new];
    for(int i=0; i<X; i++) {
        needed[@(i+1)] = @(i+1);
    }
    
    for(int i=0; i<A.count; i++) {
        int thisVal = [A[i] intValue];
        if(thisVal <= X && needed[A[i]] != nil) {
            [needed removeObjectForKey:A[i]];
        }
        if(needed.count == 0) {
            return i;
        }
    }
    return -1;
}