$version: "2"

namespace shopping.inandout.stand

use shopping.inandout#AuditMetadata
use shopping.inandout#PositiveDouble
use shopping.inandout#UUID
use shopping.inandout.article#ArticleSummary

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
