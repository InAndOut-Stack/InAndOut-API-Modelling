$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout.util#OutputPagination
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#UUID

structure StandSummary {
    @required
    storeId: UUID

    @required
    standId: UUID

    @required
    articleId: UUID

    @required
    edgeId: UUID

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
