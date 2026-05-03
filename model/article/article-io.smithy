$version: "2"

namespace com.shopping.inandout.article

use com.shopping.inandout.util#Currency
use com.shopping.inandout.util#InputPagination
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#UUID

structure CreateArticleInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    productSlug: String

    @required
    price: Price
}

structure GetArticleInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    articleSlug: Slug
}

structure ListArticlesInput with [InputPagination] {
    @required
    @httpLabel
    brandSlug: Slug

    @httpQuery("amount")
    @documentation("Price amount in the currency of the article.")
    amount: PositiveDouble

    @httpQuery("name")
    @documentation("Literal product name.")
    name: ResourceName

    @httpQuery("subcategory")
    @documentation("Literal product subcategory.")
    subcategory: ResourceName

    @httpQuery("category")
    @documentation("Literal product category.")
    category: ResourceName

    @httpQuery("vendor")
    @documentation("Literal product vendor.")
    vendor: ResourceName
}

structure UpdateArticleInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    articleSlug: Slug

    price: Price
}

structure DeleteArticleInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    articleSlug: Slug
}
