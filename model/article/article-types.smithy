$version: "2"

namespace com.shopping.inandout.article

use com.shopping.inandout.util#Description
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#OutputPagination
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug

structure ProductSummary {
    @required
    productSlug: Slug

    @required
    name: ResourceName

    @required
    approved: Boolean

    subcategory: ResourceName

    category: ResourceName

    vendor: ResourceName

    imageUrl: ImageUrl

    description: Description

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}

structure ArticleSummary {
    @required
    brandSlug: Slug

    @required
    articleSlug: Slug

    @required
    productSummary: ProductSummary

    @required
    price: Price

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}

list ArticleSummaryList {
    member: ArticleSummary
}

structure ArticleSummaries with [OutputPagination] {
    tokens: ArticleSummaryList
}
