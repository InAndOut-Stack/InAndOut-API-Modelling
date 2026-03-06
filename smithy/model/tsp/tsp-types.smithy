$version: "2"

namespace com.shopping.inandout.tsp

use com.shopping.inandout#UUIDList

@documentation("Optimal market route")
structure Solution {
    @required
    @documentation("Ordered location list of the selected articles")
    nodeIdList: UUIDList
}

list SolutionList {
    member: Solution
}
