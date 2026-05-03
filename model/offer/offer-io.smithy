$version: "2"

namespace com.shopping.inandout.offer

use com.shopping.inandout.util#InputPagination
use com.shopping.inandout.util#NaturalNumber
use com.shopping.inandout.util#Percentage
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#SlugList
use com.shopping.inandout.util#TimeRange
use com.shopping.inandout.util#UID
use com.shopping.inandout.util#UIDList

structure CreateOfferInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    percentage: Percentage

    storeIdList: UIDList

    @required
    articleSlugList: SlugList

    dependencyList: DependencyList

    timeRange: TimeRange

    @required
    lifetime: NaturalNumber
}

structure GetOfferInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    offerId: UID
}

structure ListOffersInput with [InputPagination] {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    offerId: UID
}

structure UpdateOfferInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    offerId: UID

    percentage: Percentage

    storeIdList: UIDList

    articleSlugList: SlugList

    dependencyList: DependencyList

    timeRange: TimeRange

    lifetime: NaturalNumber
}

structure DeleteOfferInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    offerId: UID
}
