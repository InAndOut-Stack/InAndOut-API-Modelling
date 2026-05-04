$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout.util#IDList
use com.shopping.inandout.util#UID
use com.shopping.inandout.util#UUID

structure CreateRouteInput {
    @required
    @httpLabel
    storeId: UID

    @required
    standIdList: IDList
}

structure GetRouteInput {
    @required
    @httpLabel
    storeId: UID

    @required
    @httpLabel
    routeId: UUID
}

structure DeleteRouteInput {
    @required
    @httpLabel
    storeId: UID

    @required
    @httpLabel
    routeId: UUID
}
