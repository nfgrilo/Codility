/* PermMissingElem
  	- Time: 6min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N) or O(N * log(N))
*/
     
int solution(NSMutableArray *A) {
    int sum = 0;
    for (int i=1; i<=A.count+1; i++) {
        sum += i;
    }

    int missing = sum;
    for (int i=0; i<A.count; i++) {
        missing -= [A[i] intValue];
    }

    return missing;
}