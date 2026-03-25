$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout.util#UUID
use com.shopping.inandout.util#UUIDList

@references([
    {
        resource: "com.shopping.inandout.store#Store"
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
