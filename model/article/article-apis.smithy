$version: "2"

namespace com.shopping.inandout.article

use com.shopping.inandout#DeleteRestrictedError
use com.shopping.inandout#InternalServerError
use com.shopping.inandout#InvalidInputError
use com.shopping.inandout#PositiveDouble
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout#UUID
use com.shopping.inandout.product#ProductSummary
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#Slug

resource Article {
    identifiers: {
        brandSlug: Slug
        // Unique within the Brand it belongs to.
        articleSlug: Slug
    }
    properties: {
        productSummary: ProductSummary
        price: Price
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateArticle
    read: GetArticle
    list: ListArticles
    update: UpdateArticle
    delete: DeleteArticle
}

@http(method: "POST", uri: "/api/brands/{brandSlug}/articles")
operation CreateArticle {
    input: CreateArticleInput
    output: ArticleSummary
    errors: [
        ResourceAlreadyExistsError
    ]
}

@readonly
@http(method: "GET", uri: "/api/brands/{brandSlug}/articles/{articleSlug}")
operation GetArticle {
    input: GetArticleInput
    output: ArticleSummary
    errors: [
        ResourceNotFoundError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/brands/{brandSlug}/articles")
operation ListArticles {
    input: ListArticlesInput
    output: ArticleSummaries
}

@http(method: "PATCH", uri: "/api/brands/{brandSlug}/articles/{articleSlug}")
operation UpdateArticle {
    input: UpdateArticleInput
    output: ArticleSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/brands/{brandSlug}/articles/{articleSlug}")
@documentation("Restricted cascading operation, references for stands should NOT exist")
operation DeleteArticle {
    input: DeleteArticleInput
    output: ArticleSummary
    errors: [
        DeleteRestrictedError
    ]
}
