$version: "2"

namespace shopping.inandout.catalog.article

use shopping.inandout#AuditMetadata
use shopping.inandout#PositiveDouble
use shopping.inandout#UUID
use shopping.inandout.catalog.product#ProductSummary
use shopping.inandout.outlet.brand#Brand

@mixin
structure ArticleMixin {
    currency: String
}

@mixin
structure ArticleInputMixin with [ArticleMixin] {}

@mixin
@references([
    {
        resource: Brand
    }
    {
        resource: Article
    }
])
structure ArticleOutputMixin with [AuditMetadata, ArticleMixin] {
    @required
    brandId: UUID

    @required
    articleId: UUID

    @required
    productSummary: ProductSummary

    @required
    price: PositiveDouble
}

structure ArticleSummary with [ArticleOutputMixin] {}
