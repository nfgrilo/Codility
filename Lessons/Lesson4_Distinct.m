/* Distinct (OPTIMAL 1, the BEST)
    - Time: 4min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N) or O(N*log(N))
*/
int solution(NSMutableArray *A) {
    NSMutableDictionary* distinct = [NSMutableDictionary new];
    for(int i=0; i<A.count; i++) {
        distinct[A[i]] = @(1);
    }
    return distinct.count;
}


/* Distinct (OPTIMAL 2)
    - Time: 5min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N*log(N)) or O(N)
*/
int solution(NSMutableArray *A) {
    if(A.count == 0) return 0;
    if(A.count == 1) return 1;
    
    NSArray* sorted = [A sortedArrayUsingSelector:@selector(compare:)];
    
    int distinct = 1;
    int last = [sorted[0] intValue];
    for(int i=1; i<A.count; i++) {
        int value = [sorted[i] intValue];
        if(last < [sorted[i] intValue]) distinct++;
        last = value;
    }
    
    return distinct;
}