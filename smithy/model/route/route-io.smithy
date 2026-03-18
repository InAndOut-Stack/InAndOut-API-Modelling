$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#UUID
use com.shopping.inandout#UUIDList
use com.shopping.inandout.store#Store

@references([
    {
        resource: Store
    }
])
structure CreateRouteInput {
    @required
    storeId: UUID

    @required
    standIdList: UUIDList
}

structure GetRouteInput {
    @required
    @httpLabel
    routeId: UUID
}

structure DeleteRouteInput {
    @required
    @httpLabel
    routeId: UUID
}
