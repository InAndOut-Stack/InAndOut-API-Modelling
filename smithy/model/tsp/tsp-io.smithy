$version: "2"

namespace com.shopping.inandout.tsp

use com.shopping.inandout#UUIDList

structure FindTspSolutionInput {
    @required
    standIdList: UUIDList
}

structure FindTspSolutionOutput {
    @required
    solutionList: SolutionList
}
