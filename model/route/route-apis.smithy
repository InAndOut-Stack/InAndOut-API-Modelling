$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.util#IDList
use com.shopping.inandout.util#UID
use com.shopping.inandout.util#UUID

@documentation("Travelling salesman problem and solution creation/retrieval")
resource Route {
    identifiers: {
        storeId: UID
        routeId: UUID
    }
    properties: {
        standIdList: IDList
        solutionList: SolutionList
    }
    create: CreateRoute
    read: GetRoute
    delete: DeleteRoute
}

@http(method: "POST", uri: "/api/stores/{storeId}/routes")
operation CreateRoute {
    input: CreateRouteInput
    output: RouteSummary
    errors: [
        ResourceAlreadyExistsError
        ResourceNotFoundError
    ]
}

@readonly
@http(method: "GET", uri: "/api/stores/{storeId}/routes/{routeId}")
operation GetRoute {
    input: GetRouteInput
    output: RouteSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/stores/{storeId}/routes/{routeId}")
operation DeleteRoute {
    input: DeleteRouteInput
    output: RouteSummary
}
