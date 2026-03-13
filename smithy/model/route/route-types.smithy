$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#UUID
use com.shopping.inandout#UUIDList
use com.shopping.inandout.stand#Stand

@references([
    {
        resource: Stand
        ids: { storeId: "storeId", standId: "standId" }
    }
])
structure StandNode {
    standId: UUID
    weight: Double
}

list StandNodeList {
    member: StandNode
}

structure Edge {
    sourceNodeId: UUID
    weight: Double
    standIdList: UUIDList
}

@documentation("Ordered list of edges (store directions) followed by Customers")
list EdgeList {
    member: Edge
}

@documentation("The optimal market path")
structure Solution {
    @required
    edgeList: EdgeList
}

@documentation("Multiple optimal solutions are returned if those exist")
list SolutionList {
    member: Solution
}

structure RouteSummary {
    @required
    storeId: UUID

    @required
    routeId: UUID

    @documentation("Returned only if the TSP operation was finished")
    solutionList: SolutionList
}
