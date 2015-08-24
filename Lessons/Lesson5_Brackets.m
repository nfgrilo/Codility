/* Brackets
    - Time: 14min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/
int solution(NSString *S) {
    if (S.length == 0) return 1;
    if (S.length == 1) return 0;
    NSMutableString* stack = [NSMutableString new];
    
    for(int i=0; i<S.length; i++) {
        unichar c = [S characterAtIndex:i];
        
        if(c == '(' || c == '[' || c == '{') {
            [stack appendFormat:@"%c", c];
        
        }else{
            if (stack.length == 0) return 0;
            unichar stackChar = [stack characterAtIndex:stack.length-1];
            if( (c == ')' && stackChar == '(')
                || (c == ']' && stackChar == '[')
                || (c == '}' && stackChar == '{')) {
                [stack deleteCharactersInRange:NSMakeRange(stack.length-1,1)];    
            }else
                return 0;
        }
    }
    
    return stack.length == 0;
}