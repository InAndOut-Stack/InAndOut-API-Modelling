$version: "2"

namespace shopping.inandout.article

use shopping.inandout#DeleteRestrictedError
use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#PositiveDouble
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID
use shopping.inandout.product#ProductSummary
use shopping.inandout.util#Price
use shopping.inandout.util#Slug

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
