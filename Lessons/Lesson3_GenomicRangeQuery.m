/* GenomicRangeQuery (OPTIMAL) 
    - Time: 105min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N + M)
*/
NSMutableArray * solution(NSString *S, NSMutableArray *P, NSMutableArray *Q) {
    // prefix sums (one for each type)
    int N = S.length;
    NSMutableArray* prefixSumsA = [NSMutableArray new];
    NSMutableArray* prefixSumsC = [NSMutableArray new];
    NSMutableArray* prefixSumsG = [NSMutableArray new];
    NSMutableArray* prefixSumsT = [NSMutableArray new];
    for(int i=0; i<N+1; i++) {
        int sumA = 0;
        int sumC = 0;
        int sumG = 0;
        int sumT = 0;
        if (i > 0) {
            sumA = [prefixSumsA[i-1] intValue];
            sumC = [prefixSumsC[i-1] intValue];
            sumG = [prefixSumsG[i-1] intValue];
            sumT = [prefixSumsT[i-1] intValue];
            unichar c = [S characterAtIndex:i-1];
            if (c == 'A') sumA += 1;
            else if (c == 'C') sumC += 2;
            else if (c == 'G') sumG += 3;
            else sumT += 4;
        }
        //printf("prefix_sum[%d]: A=%d, C=%d, G=%d, T=%d\n", i, sumA, sumC, sumG, sumT);
        [prefixSumsA addObject:@(sumA)];
        [prefixSumsC addObject:@(sumC)];
        [prefixSumsG addObject:@(sumG)];
        [prefixSumsT addObject:@(sumT)];
    }
    
    // iterate questions
    NSMutableArray* answers = [NSMutableArray new];
    int M = P.count;
    for (int q=0; q<M; q++) {
        int start = [P[q] intValue];
        int end = [Q[q] intValue];
        
        int sumA = [prefixSumsA[end+1] intValue] - [prefixSumsA[start] intValue];
        //printf("[%d, %d] sumA: %d\n", start, end, sumA);
        if (sumA > 0) [answers addObject:@(1)];
        else{
            int sumC = [prefixSumsC[end+1] intValue] - [prefixSumsC[start] intValue];
            //printf("[%d, %d] sumC: %d\n", start, end, sumC);
            if (sumC > 0) [answers addObject:@(2)];
            else{
                int sumG = [prefixSumsG[end+1] intValue] - [prefixSumsG[start] intValue];
                //printf("[%d, %d] sumG: %d\n", start, end, sumG);
                if (sumG > 0) [answers addObject:@(3)];
                else{
                    int sumT = [prefixSumsT[end+1] intValue] - [prefixSumsT[start] intValue];
                    //printf("[%d, %d] sumT: %d\n", start, end, sumT);
                    [answers addObject:@(4)];
                }
            }
        }
    }
    
    return answers;
}



/* GenomicRangeQuery (COORECT but BAD PERFORMANCE) 
    - Time: 14min
    - Score 100% (100% correct, 0% performance)
    - Detected Time Complexity: O(N*M)
*/
NSMutableArray * solution(NSString *S, NSMutableArray *P, NSMutableArray *Q) {
    // reset answers
    NSMutableArray* answers = [NSMutableArray new];
    int M = P.count;
    for (int q=0; q<M; q++) {
        [answers addObject:@(4)];
    }
    
    // iterate sequence
    int N = S.length;
    for (int k=0; k<N; k++) {
        unichar c = [S characterAtIndex:k];
        int factor = 4;
        if (c == 'A') factor = 1;
        else if (c == 'C') factor = 2;
        else if (c == 'G') factor = 3;
        
        for (int q=0; q<M; q++) {
            if(k >= [P[q] intValue] && k <= [Q[q] intValue] && [answers[q] intValue] > factor) {
                answers[q] = @(factor);
            }
        }
    }
    
    return answers;
}