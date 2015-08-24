/* Dominator
    - Time: 10min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N*log(N)) or O(N)
*/
int solution(NSMutableArray *A) {
    NSMutableArray* stack = [NSMutableArray new];
    NSMutableArray* stackix = [NSMutableArray new];
    
    int ix = -1;
    for(int i=0; i<A.count; i++) {
        int value = [A[i] intValue];
        if(stack.count == 0) {
            [stack addObject:A[i]];
            [stackix addObject:@(i)];
        }else{
            int stackValue = [stack.lastObject intValue];
            if (stackValue == value) {
                [stack addObject:A[i]];
                [stackix addObject:@(i)];
            }else{
                [stack removeLastObject];
                [stackix removeLastObject];
            }
        }
    }
    
    if(stack.count > 0) {
        int candidateValue = [stack.lastObject intValue];
        int candidateIX = [stackix.lastObject intValue];
        int count = 0;
        for(int i=0; i<A.count; i++) {
            if([A[i] intValue] == candidateValue) count++;
        }
        if(count > A.count/2) {
            ix = candidateIX;
        }
    }
    
    return ix;
}