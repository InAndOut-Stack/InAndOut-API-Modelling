$version: "2"

namespace shopping.inandout.offer

use com.shopping.inandout#AuditMetadata
use com.shopping.inandout#NaturalNumber
use com.shopping.inandout#Percentage
use com.shopping.inandout#TimeRange
use com.shopping.inandout#UUID
use com.shopping.inandout#UUIDList
use com.shopping.inandout.article#Article
use com.shopping.inandout.store#Store

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
