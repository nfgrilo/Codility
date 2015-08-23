/* PassingCars
    - Time: 9min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(N)
*/
int solution(NSMutableArray *A) {
    unsigned long count = 0;
    unsigned long count0 = 0;
    
    for (int i=0; i<A.count; i++) {
        if ([A[i] intValue] == 0) {
            count0++;
        }else if (count0>0) {
            count += count0;
        }
    }
    return (int) (count > 1000000000 ? -1 : count);
}