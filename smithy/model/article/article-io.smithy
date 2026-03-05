$version: "2"

namespace shopping.inandout.article

use shopping.inandout#BrandIdMixin
use shopping.inandout#PositiveDouble
use shopping.inandout#UUID
use shopping.inandout.product#CreateProductInput
use shopping.inandout.product#Product

@references([
    {
        resource: Product
    }
])
structure CreateArticleInput with [BrandIdMixin, ArticleInputMixin] {
    @required
    price: PositiveDouble

    // Clients must choose between providing a product id/details.
    // Not none, not both, one field must be filled.
    @notProperty
    @documentation("Existing product referenced in a new article")
    productId: UUID

    @notProperty
    @documentation("Creates a new product")
    createProductInput: CreateProductInput
}

structure CreateArticleOutput {
    @required
    articleId: UUID
}

structure GetArticleInput with [BrandIdMixin] {
    @required
    @httpLabel
    articleId: UUID
}

structure GetArticleOutput with [ArticleOutputMixin] {}

structure UpdateArticleInput with [BrandIdMixin, ArticleInputMixin] {
    @required
    @httpLabel
    articleId: UUID

    price: PositiveDouble
}

structure UpdateArticleOutput with [ArticleOutputMixin] {}

structure DeleteArticleInput with [BrandIdMixin] {
    @required
    @httpLabel
    articleId: UUID
}

structure DeleteArticleOutput {}
