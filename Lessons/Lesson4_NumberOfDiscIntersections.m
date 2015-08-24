/* NumberOfDiscIntersections
    - Time: 58min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N*log(N)) or O(N)
*/
int solution(NSMutableArray *A) {  
    if(A.count < 2) return 0;

    NSMutableArray* starts = [NSMutableArray new];
    NSMutableArray* ends = [NSMutableArray new];
    for(int i=0; i<A.count; i++) {
        long start = i - (long)[A[i] intValue];
        long finish = i + (long)[A[i] intValue];
        [starts addObject:@(start)];
        [ends addObject:@(finish)];
    }
    NSArray* ss = [starts sortedArrayUsingSelector:@selector(compare:)];
    NSArray* se = [ends sortedArrayUsingSelector:@selector(compare:)];

    int count = 0;
    long opens = 0;
    int e = 0;
    for(int s=0; s<A.count; s++) {
        opens++;
        if (opens > 1) {
            count += (opens-1);
        }
        if(s+1 < A.count) {
            long nextOpenVal = [ss[s+1] longValue];
            long nextCloseVal;
            while(e < A.count && (nextCloseVal = [se[e] longValue]) < nextOpenVal) {
                opens--;
                e++;
            }
        }
    }
    
    return count > 10000000 ? -1 : count;
}