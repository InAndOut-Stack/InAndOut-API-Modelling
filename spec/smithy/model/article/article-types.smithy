$version: "2"

namespace shopping.inandout.article

use shopping.inandout#AuditMetadata
use shopping.inandout#PositiveDouble
use shopping.inandout#UUID
use shopping.inandout.brand#Brand
use shopping.inandout.product#ProductSummary

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
