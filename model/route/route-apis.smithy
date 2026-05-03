$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.util#UUID
use com.shopping.inandout.util#UUIDList

@documentation("Travelling salesman problem and solution creation/retrieval")
resource Route {
    identifiers: {
        routeId: UUID
    }
    properties: {
        storeId: UID
        standIdList: IDList
        solutionList: SolutionList
    }
    create: CreateRoute
    read: GetRoute
    delete: DeleteRoute
}

@http(method: "POST", uri: "/api/routes")
operation CreateRoute {
    input: CreateRouteInput
    output: RouteSummary
    errors: [
        ResourceAlreadyExistsError
    ]
}

@readonly
@http(method: "GET", uri: "/api/routes/{routeId}")
operation GetRoute {
    input: GetRouteInput
    output: RouteSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/routes/{routeId}")
operation DeleteRoute {
    input: DeleteRouteInput
    output: RouteSummary
}
