class SmallestInfiniteSet {
    private var popSmallests: [Int] = [1]
    private var lastPopValue: Int = 0
    init() {
        
    }
    
    func popSmallest() -> Int {
        let result = popSmallests.removeFirst()
        lastPopValue = max(lastPopValue, result)
        if !popSmallests.contains(lastPopValue + 1) {
            popSmallests.insert(lastPopValue + 1, at: 0)
        }
        print(popSmallests)
        return result
    }
    
    func addBack(_ num: Int) {
        if let index = popSmallests.firstIndex(where: { $0 > num }) {
            popSmallests.insert(num, at: index)
        }
    }
}

let obj = SmallestInfiniteSet()
let ret_1: Int = obj.popSmallest()
obj.addBack(1)
obj.popSmallest()
obj.popSmallest()
obj.popSmallest()
obj.addBack(2)
obj.addBack(3)
obj.popSmallest()
obj.popSmallest()
