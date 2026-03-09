$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout#OutputPagination
use com.shopping.inandout#PositiveDouble
use com.shopping.inandout#UUID

structure StandSummary {
    @required
    storeId: UUID

    @required
    standId: UUID

    @required
    articleId: UUID

    @required
    edgeId: UUID

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
