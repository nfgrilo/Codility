/* CountDiv
    - Time: 22min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(1)
*/
int solution(int A, int B, int K) {
    int divisable_by_A = (int)((A>0?(A-1):0)/K);
    int divisable_by_B = (int)(B/K);
    return divisable_by_B - divisable_by_A + (A==0?1:0);
}