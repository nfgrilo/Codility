/* MaxCounters (OPTIMAL)
    - Time: 36min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N + M)
*/
NSMutableArray* solution(int N, NSMutableArray *A) {
    // init counters
    NSMutableArray* counters = [NSMutableArray new];
    for(int i=0; i<N; i++) {
        [counters addObject:@(0)];
    }
    int max_incs = 0;
    int currMax = 0 ;
    
    // operations
    for(int i=0; i<A.count; i++) {
        int x = [A[i] intValue];
        if (x >= 1 && x <= N) {
            // check if pending 'max counter'
            int base = [counters[x-1] intValue];
            if (base < max_incs) {
                base = max_incs;
            }
        
            // increase(X)
            int newVal = base + 1;
            counters[x-1] = @(newVal);
            if (newVal > currMax) currMax = newVal;
        }else{
            // max counter
            max_incs = currMax;
        }
    }
    
    // check pending 'max counter' ops
    for(int i=0; i<N; i++) {
        int base = [counters[i] intValue];
        if (base < max_incs) {
            counters[i] = @(max_incs);
        }
    }
    
    return counters;
}


/* MaxCounters (CORRECT but not BEST PERFORMANCE)
    - Time: 18min
    - Score 100% (100% correct, 40% performance)
    - Detected Time Complexity: O(N*M)
*/

NSMutableArray* solution(int N, NSMutableArray *A) {
    // init counters
    NSMutableArray* counters = [NSMutableArray new];
    for(int i=0; i<N; i++) {
        [counters addObject:@(0)];
    }
    int currMax = 0;
    
    // operations
    for(int i=0; i<A.count; i++) {
        int x = [A[i] intValue];
        if (x >= 1 && x <= N) {
            // increase(X)
            int newVal = [counters[x-1] intValue] + 1;
            counters[x-1] = @(newVal);
            if (newVal > currMax) currMax = newVal;
        }else{
            // max counter
            for(int j=0; j<N; j++) {
                counters[j] = @(currMax);
            }
        }
    }
    
    return counters;
}