/* FrogJmp
    - Time: 4min
    - Score 100% (100% correct, 100% performance)
    - Detected Time Complexity: O(1)
*/
     
int solution(int X, int Y, int D) {
    return ((Y - X) / D) + ((Y - X) % D > 0 ? 1 : 0);
}