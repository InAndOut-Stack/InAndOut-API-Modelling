$version: "2"

namespace shopping.inandout.offer

use com.shopping.inandout#InputPagination
use com.shopping.inandout#OutputPagination
use com.shopping.inandout#Percentage
use com.shopping.inandout#StoreIdMixin
use com.shopping.inandout#UUID

structure CreateOfferInput  {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    percentage: Percentage

    storeIdList: UUIDList

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

    storeIdList: UUIDList

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
