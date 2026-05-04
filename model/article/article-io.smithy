$version: "2"

namespace com.shopping.inandout.article

use com.shopping.inandout.util#InputPagination
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug

structure CreateArticleInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @notProperty
    productSlug: Slug

    @required
    defaultAmount: PositiveDouble
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
    amount: PositiveDouble

    @httpQuery("name")
    @documentation("Product name")
    name: ResourceName

    @httpQuery("subcategory")
    @documentation("Product subcategory")
    subcategory: ResourceName

    @httpQuery("category")
    @documentation("Product category")
    category: ResourceName

    @httpQuery("vendor")
    @documentation("Product vendor")
    vendor: ResourceName
}

structure UpdateArticleInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    articleSlug: Slug

    defaultAmount: PositiveDouble
}

structure DeleteArticleInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    articleSlug: Slug
}
