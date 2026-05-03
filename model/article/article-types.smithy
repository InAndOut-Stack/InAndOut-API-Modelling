$version: "2"

namespace shopping.inandout.article

use shopping.inandout#AuditMetadata
use shopping.inandout#PositiveDouble
use shopping.inandout#ResourceName
use shopping.inandout#Timestamp
use shopping.inandout#UUID
use shopping.inandout.util#Price
use shopping.inandout.util#Slug

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
