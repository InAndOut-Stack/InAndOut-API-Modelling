$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout.util#Currency
use com.shopping.inandout.util#InputPagination
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#UUID

structure CreateStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    articleId: UUID

    @required
    edgeId: UUID

    price: Price

    sourceNodeDistance: PositiveDouble
}

structure GetStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID
}

structure ListStandsInput with [InputPagination] {
    @required
    @httpLabel
    storeId: UUID

    @httpQuery("edgeId")
    edgeId: UUID

    @httpQuery("articleId")
    articleId: UUID

    @httpQuery("priceAmount")
    priceAmount: PositiveDouble

    @httpQuery("priceCurrency")
    @default("RON")
    priceCurrency: Currency
}

structure UpdateStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID

    edgeId: UUID

    price: Price

    sourceNodeDistance: PositiveDouble
}

structure DeleteStandInput {
    @required
    @httpLabel
    storeId: UUID

    @required
    @httpLabel
    standId: UUID
}
