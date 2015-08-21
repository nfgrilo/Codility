/* TapeEquilibrium
    - Time: 12min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/
     
int solution(NSMutableArray *A) {
    int sum = 0;
    for (int i=0; i<A.count; i++) {
        sum += [A[i] intValue];
    }

    int min_diff = -1;
    int half1 = 0;
    for(int p=1; p<A.count; p++) {
        half1 += [A[p-1] intValue];
        int half2 = sum - half1;
        int diff = abs(half1 - half2);
        if(p == 1 || diff < min_diff) {
            min_diff = diff;
        }
    }
    
    return min_diff;
}