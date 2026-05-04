$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout.util#ID
use com.shopping.inandout.util#OutputPagination
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#UID

structure StandSummary {
    @required
    brandSlug: Slug

    @required
    storeUid: UID

    @required
    standId: ID

    @required
    articleSlug: Slug

    @required
    edgeId: ID

    price: Price

    sourceNodeDistance: PositiveDouble

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}

list StandSummaryList {
    member: StandSummary
}

structure StandSummaries with [OutputPagination] {
    tokens: StandSummaryList
}
