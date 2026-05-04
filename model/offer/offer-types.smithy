$version: "2"

namespace com.shopping.inandout.offer

use com.shopping.inandout.util#ID
use com.shopping.inandout.util#NaturalNumber
use com.shopping.inandout.util#OutputPagination
use com.shopping.inandout.util#Percentage
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#SlugList
use com.shopping.inandout.util#TimeRange
use com.shopping.inandout.util#UIDList

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
    brandSlug: Slug

    @required
    offerId: ID

    @required
    percentage: Percentage

    storeIdList: UIDList

    @required
    articleSlugList: SlugList

    dependencyList: DependencyList

    timeRange: TimeRange

    @required
    lifetime: NaturalNumber

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}

list OfferSummaryList {
    member: OfferSummary
}

structure OfferSummaries with [OutputPagination] {
    tokens: OfferSummaryList
}
