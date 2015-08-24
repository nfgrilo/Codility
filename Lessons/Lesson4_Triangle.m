/* Triangle
    - Time: 23min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N*log(N))
*/
int solution(NSMutableArray *A) {
    if(A.count < 3) return 0;
    
    NSArray* sorted = [A sortedArrayUsingSelector:@selector(compare:)];
    
    for (int i=0; i<A.count-2; i++) {
        long P = [sorted[i] longValue];
        long Q = [sorted[i+1] longValue];
        long R = [sorted[i+2] longValue];
        if (P + Q > R && Q + R > P && R + P > Q) {
            return 1;
        }
    }
    
    return 0;
}