$version: "2"

namespace com.shopping.inandout.route

use com.shopping.inandout.util#ID
use com.shopping.inandout.util#IDList
use com.shopping.inandout.util#UUID

structure CreateRouteInput {
    @required
    storeId: UID

    @required
    standIdList: IDList
}

structure GetRouteInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeUid: UID

    @required
    @httpLabel
    routeUid: UID
}

structure DeleteRouteInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeUid: UID

    @required
    @httpLabel
    routeUid: UID
}
