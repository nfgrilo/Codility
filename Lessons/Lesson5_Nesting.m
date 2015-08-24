/* Nesting
    - Time: 6min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/
int solution(NSString *S) {
    if (S.length == 0) return 1;
    if (S.length == 1) return 0;
    
    int open = 0;
    for(int i=0; i<S.length; i++) {
        unichar c = [S characterAtIndex:i];
        if(c == '(') open++;
        else if(open>0) open--;
        else return 0;
    }
    
    return open == 0;
}