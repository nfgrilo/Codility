/* MinAvgTwoSlice (OPTIMAL)
    - Time: (29min) + 17min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/
int solution(NSMutableArray *A) {
	// calculate prefix sums (faster)
    int N = A.count;
    NSMutableArray* prefixSums = [NSMutableArray new];
    for(int i=0; i<N+1; i++) {
        int sum = i == 0 ? 0 : [prefixSums[i-1] intValue] + [A[i-1] intValue];
        [prefixSums addObject:@(sum)];
    }
    
    int start = 0;
    double min_avg = ((double)[prefixSums[2] intValue] - (double)[prefixSums[0] intValue]) 
                        / (double)2;
    for(int P=0; P<N-2; P++) {
        // test 2-element slice
        int Q = P + 1;
        {
            double avg = ((double)[prefixSums[Q+1] intValue] - (double)[prefixSums[P] intValue]) 
                        / (double)(Q - P + 1);
            if (avg < min_avg) {
                start = P;
                min_avg = avg;
            }
        }
        // test 3-element slice
        Q++;
        {
            double avg = ((double)[prefixSums[Q+1] intValue] - (double)[prefixSums[P] intValue]) 
                        / (double)(Q - P + 1);
            if (avg < min_avg) {
                start = P;
                min_avg = avg;
            }
        }
    }
    
    // test last 2-element slice
    double avg = ((double)[prefixSums[N] intValue] - (double)[prefixSums[N-2] intValue]) 
                        / (double)2;
    if (avg < min_avg) {
    	start = N-2;
        //min_avg = avg;
    }
    
    return start;
}


/* MinAvgTwoSlice (CORRECT but BAD PERFORMANCE)
    - Time: 29min
    - Score 60% (100% correct, 20% performance)
    - Detected Time Complexity: O(N ** 2)
*/
int solution(NSMutableArray *A) {
    int N = A.count;
    NSMutableArray* prefixSums = [NSMutableArray new];
    for(int i=0; i<N+1; i++) {
        int sum = i == 0 ? 0 : [prefixSums[i-1] intValue] + [A[i-1] intValue];
        [prefixSums addObject:@(sum)];
    }
    
    int start = -1;
    double min_avg = 0;
    for(int P=0; P<N-1; P++) {
        for(int Q=P+1; Q<N; Q++) {
            double avg = ((double)[prefixSums[Q+1] intValue] - (double)[prefixSums[P] intValue]) 
                        / (double)(Q - P + 1);
            if (start == -1 || avg < min_avg) {
                start = P;
                min_avg = avg;
            }
        }
    }
    
    return start;
}