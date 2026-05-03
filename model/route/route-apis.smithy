$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.util#IDList
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#UID

@documentation("Travelling salesman problem and solution creation/retrieval")
resource Route {
    identifiers: {
        brandSlug: Slug
        storeUid: UID
        routeUid: UID
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

@http(method: "POST", uri: "/api/brands/{brandSlug}/stores/{storeUid}/routes")
operation CreateRoute {
    input: CreateRouteInput
    output: RouteSummary
    errors: [
        ResourceAlreadyExistsError
        ResourceNotFoundError
    ]
}

@readonly
@http(method: "GET", uri: "/api/brands/{brandSlug}/stores/{storeUid}/routes/{routeUid}")
operation GetRoute {
    input: GetRouteInput
    output: RouteSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/brands/{brandSlug}/stores/{storeUid}/routes/{routeUid}")
operation DeleteRoute {
    input: DeleteRouteInput
    output: RouteSummary
}
