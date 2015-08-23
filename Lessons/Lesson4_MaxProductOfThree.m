/* MaxProductOfThree (OPTIMAL)
    - Time: 24min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N * log(N))
*/
int solution(NSMutableArray *A) {
    NSArray* sorted = [A sortedArrayUsingSelector:@selector(compare:)];
    
    int max3Low = [sorted[0] intValue] * [sorted[1] intValue] * [sorted[2] intValue];
    int max2Low = [sorted[0] intValue] * [sorted[1] intValue] * [sorted[A.count-1] intValue];
    int max1Low = [sorted[0] intValue] * [sorted[A.count-1] intValue] * [sorted[A.count-2] intValue];
    int max3Hi = [sorted[A.count-1] intValue] * [sorted[A.count-2] intValue] * [sorted[A.count-3] intValue];
    
    int max = max3Hi;
    if (max1Low > max) max = max1Low;
    if (max2Low > max) max = max2Low;
    if (max3Low > max) max = max3Low;
    
    return max;
}



/* MaxProductOfThree (CORRECT but not required performance)
    - Time: 12min
    - Score 44% (100% correct, 0% performance)
    - Detected Time Complexity: O(N**3)
*/
int solution(NSMutableArray *A) {
    // initialize P, Q, R (sorted)
    int max = INT_MIN;
    
    // if array has more than 3 elements...
    for(int p=0; p<A.count; p++) {
        int P = [A[p] intValue];
        for(int q=p+1; q<A.count; q++) {
            int Q = [A[q] intValue];
            for(int r=q+1; r<A.count; r++) {
                int R = [A[r] intValue];
                if (max < P * Q * R) max = P * Q * R;
            }
        }
    }
    
    return max;
}

