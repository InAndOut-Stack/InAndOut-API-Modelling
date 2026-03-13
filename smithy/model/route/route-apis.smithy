$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#InternalServerError
use com.shopping.inandout#InvalidInputError
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout#UUID

@documentation("Travelling salesman problem and solution creation/retrieval")
resource Route {
    identifiers: {
        routeId: UUID
    }
    properties: {
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
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/api/routes/{routeId}")
operation GetRoute {
    input: GetRouteInput
    output: RouteSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/routes/{routeId}")
operation DeleteRoute {
    input: DeleteRouteInput
    output: RouteSummary
    errors: [
        InvalidInputError
        InternalServerError
    ]
}
