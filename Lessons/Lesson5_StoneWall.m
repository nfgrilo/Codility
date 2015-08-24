/* StoneWall
    - Time: 36min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/
int solution(NSMutableArray *H) {
    NSMutableArray* stack = [NSMutableArray new];
    
    int blocks = 0;
    for(int i=0; i<H.count; i++) {
        if (stack.count > 0) {
            int height = [H[i] intValue];
            int prevHeight = [stack[stack.count-1] intValue];
            if (prevHeight < height) {
                // height is increasing, just add to the stack
                [stack addObject:H[i]];
            }
            else if (prevHeight > height) {
                // remove from stack until a smaller block is found
                while(stack.count > 0 && [stack[stack.count-1] intValue] > height) {
                    // remove last from stack, increase blocks counter
                    [stack removeLastObject];
                    blocks++;
                }
                
                // but only add new, if not equal to last in stack!
                if (stack.count > 0) {
                    prevHeight = [stack[stack.count-1] intValue];
                    if (prevHeight != height) {
                        [stack addObject:H[i]];
                    }
                }else{
                    [stack addObject:H[i]];
                }
            }
            // do nothing if equal
            
        }else{
            // stack is empty (first, or nothing below)
            [stack addObject:H[i]];
        }
    }
    
    blocks += stack.count;
    
    return blocks;
}