$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#UUID
use com.shopping.inandout#UUIDList

structure CreateRouteInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    standIdList: UUIDList
}

structure GetRouteInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    routeId: UUID
}

structure DeleteRouteInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    routeId: UUID
}
