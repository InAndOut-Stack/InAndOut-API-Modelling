$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout.util#UUID
use com.shopping.inandout.util#UUIDList

@documentation("In between nodes navigable stand points")
structure StandNode {
    @required
    standId: UUID

    weight: Double
}

list StandNodeList {
    member: StandNode
}

structure TspEdge {
    @required
    edgeId: UUID

    @required
    startingNodeId: UUID

    standNodeList: StandNodeList
}

@documentation("Ordered list of edges/aisles")
list TspEdgeList {
    member: TspEdge
}

@documentation("The optimal market path")
structure Solution {
    @required
    edgeList: TspEdgeList
}

@documentation("Multiple optimal solutions are returned if those exist")
list SolutionList {
    member: Solution
}

structure RouteSummary {
    @required
    routeId: UUID

    @required
    storeId: UID

    @required
    @documentation("The initial input")
    standIdList: UUIDList

    @documentation("Returned only if the TSP operation was finished")
    solutionList: SolutionList
}
