/**
 605. Can Place Flowers
 Easy
 3.5K
 716
 Companies
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.

 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.

  

 Example 1:

 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:

 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
  

 Constraints:

 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length
 */

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var index = 0
        var count = 0
        var flowered = flowerbed

        while flowered.count > index  {
            if flowered[index] == 0
                   && ((index - 1 >= 0 && index + 1 < flowered.count && flowered[index - 1] == 0 && flowered[index + 1] == 0)
                   || (index + 1 >= flowered.count && index - 1 >= 0 && flowered[index - 1] == 0)
                   || (index - 1 < 0 && index + 1 < flowered.count && flowered[index + 1] == 0)
                   || (index - 1 < 0 && index + 1 >= flowered.count))
                {
                    flowered[index] = 1
                    count += 1
                    index += 2
            } else {
                 index += 1
            }
        }
        return count >= n
    }
}
