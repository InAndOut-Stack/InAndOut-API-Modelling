$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout#UUID

structure CreateRouteInput {}

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
