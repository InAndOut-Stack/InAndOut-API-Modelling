$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#UUID
use com.shopping.inandout#UUIDList

@documentation("Optimal market route")
structure InStoreSolution {
    @required
    storeId: UUID

    @required
    @documentation("Ordered location list of the selected articles")
    nodeIdList: UUIDList
}

@documentation("The route might involve traversing multiple stores")
list Solution {
    member: InStoreSolution
}

@documentation("Multiple optimal solutions are returned if those exist")
list SolutionList {
    member: Solution
}

// Subfields are not required
structure RouteSummary {
    routeId: UUID

    @documentation("Returned only if the TSP operation was finished")
    solutionList: SolutionList
}
