$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout.util#ID
use com.shopping.inandout.util#InputPagination
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#UID

structure CreateStandInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID

    @required
    articleSlug: Slug

    @required
    edgeId: ID

    price: Price

    sourceNodeDistance: PositiveDouble
}

structure GetStandInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID

    @required
    @httpLabel
    standId: ID
}

structure ListStandsInput with [InputPagination] {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID

    @httpQuery("edgeId")
    edgeId: ID

    @httpQuery("name")
    productName: ResourceName

    @httpQuery("amount")
    amount: PositiveDouble
}

structure UpdateStandInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID

    @required
    @httpLabel
    standId: ID

    edgeId: ID

    price: Price

    sourceNodeDistance: PositiveDouble
}

structure DeleteStandInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID

    @required
    @httpLabel
    standId: ID
}
