/*
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.

  

 Example 1:

 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Output: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
  

 Constraints:

 2 <= nums.length <= 104
 -109 <= nums[i] <= 109
 -109 <= target <= 109
 Only one valid answer exists.
 */



//bruteforce
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        //nums가 0일경우 빈어레이 리턴
        if nums.count < 1 {
            return nums
        }

        
        //처음 값을꺼내고 그 다음값부터 마지막까지 탐색하면서 target의 합이 나오는 인덱스를 리턴
        //0부터 nums.count까지 돌고 i+1부터 count까지 돌기때문에 o(n2)
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] + nums[j] == target {
                    return [i,j]
                }
            }
        }
        return [0]
    }
}

let solution = Solution()
solution.twoSum([109,108,-108],1)


//hashmap
class Solution2 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        //nums가 0일경우 빈어레이 리턴
        if nums.count < 1 {
            return nums
        }
        
        /*
         0 : 2
         1 : 7
         2: 11
         3: 15
         */
    
        //해시맵
        var dic = [Int:Int]()
        
        //인덱스,값으로 빼줌.(enumerated)
        for (i,v) in nums.enumerated() {
            print(dic)
            print(i)
            print(v)
            //dictionary의 키를 value, 값을 index로 설정
            //목표target에서 현재 value를 뺀 index값이 있는지 검사하고 있다면 index값이랑 i리턴해줌
            if let index = dic[target - v] {
                return [index , i]
            }
            //그게 아니라면 현재 값을 키로 index를 해쉬맵에 저장.
            dic[v] = i
        }
        return []
    }
}

let solution2 = Solution2()
solution2.twoSum([3,2,4],6)


