$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout#AuditMetadata
use com.shopping.inandout#PositiveDouble
use com.shopping.inandout#UUID
use com.shopping.inandout.article#ArticleSummary

@mixin
structure StandOutputMixin with [AuditMetadata] {
    @required
    standId: UUID

    @required
    edgeId: UUID

    @required
    sourceNodeDistance: PositiveDouble

    @required
    articleSummary: ArticleSummary
}

structure StandSummary with [StandOutputMixin] {}

list StandSummaryList {
    member: StandSummary
}
