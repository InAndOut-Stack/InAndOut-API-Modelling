$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout.util#ID
use com.shopping.inandout.util#IDList
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#UID

@documentation("In between nodes navigable stand points")
structure StandNode {
    @required
    standId: ID

    weight: Double
}

list StandNodeList {
    member: StandNode
}

structure TspEdge {
    @required
    edgeId: ID

    @required
    startingNodeId: ID

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
    brandSlug: Slug

    @required
    storeUid: UID

    @required
    routeUid: UID

    @required
    @documentation("The initial input")
    standIdList: IDList

    @documentation("Returned only if the TSP operation was finished")
    solutionList: SolutionList
}
