/* PermCheck
    - Time: 14min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N) or O(N * log(N))
*/

#import <Foundation/NSDictionary.h>

int solution(NSMutableArray *A) {
    NSMutableDictionary *map = [NSMutableDictionary new];
    
    int is_perm = -1;
    for(int i=0; i<A.count; i++) {
        int val = [A[i] intValue];
        if(val > A.count || val == 0 || map[@(val)] != nil) {
            is_perm = 0;
            break;
        }
        map[@(val)] = @(val);
    }
    if(is_perm != 0) is_perm = 1;
    
    return is_perm;
}