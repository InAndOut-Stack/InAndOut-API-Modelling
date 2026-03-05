$version: "2"

namespace shopping.inandout.tsp

use shopping.inandout#UUIDList

structure FindTspSolutionInput {
    @required
    standIdList: UUIDList
}

structure FindTspSolutionOutput {
    @required
    soltuionList: SoltuionList
}
