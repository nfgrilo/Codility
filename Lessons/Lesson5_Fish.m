/* Fish
    - Time: 26min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/
int solution(NSMutableArray *A, NSMutableArray *B) {
    if (A.count == 1) return 1;
    NSMutableArray* stack = [NSMutableArray new];
    
    int escaped = 0;
    for(int P=0; P<A.count; P++) {
        // no previous fish in stack, fish going upstream
        int direction = [B[P] intValue];
        if(stack.count == 0 && direction == 0) {
            escaped++;
        }
        // fishes in stack, fish is going upstream
        else if(stack.count > 0 && direction == 0){
            BOOL stackFishEaten = YES;
            int upSize = [A[P] intValue];
            while(stack.count > 0 && stackFishEaten) {
                int downSize = [stack.lastObject intValue];
                if(downSize < upSize) {
                    [stack removeLastObject];
                    stackFishEaten = YES;
                }else{
                    stackFishEaten = NO;
                }
            }
            if(stack.count == 0)
                escaped++;
        }else if(direction == 1) {
            [stack addObject:A[P]];
        }
    }
    
    return escaped + stack.count;
}