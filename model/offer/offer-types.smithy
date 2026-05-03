$version: "2"

namespace shopping.inandout.offer

use shopping.inandout#AuditMetadata
use shopping.inandout#NaturalNumber
use shopping.inandout#Percentage
use shopping.inandout#TimeRange
use shopping.inandout#UUID
use shopping.inandout#UUIDList
use shopping.inandout.article#Article
use shopping.inandout.store#Store

@documentation("Product dependency; it must be bought in order for the offer to activate.")
structure Dependency {
    @required
    articleSlug: Slug
    
    quantity: NaturalNumber
}

list DependencyList {
    member: Dependency
}

structure OfferSummary {
    @required
    brandSlug: UUID

    @required
    offerId: UID

    @required
    percentage: Percentage

    storeIdList: UIDList

    articleSlugList: SlugList

    dependencyList: DependencyList

    timeRange: TimeRange

    lifetime: NaturalNumber

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}

list OfferSummaryList {
    members: OfferSummary
}

structure OfferSummaries with [OutputPagination] {
    tokens: OfferSummaryList
}
