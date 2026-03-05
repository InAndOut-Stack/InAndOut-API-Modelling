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

resource Article {
    identifiers: {
        articleId: UUID
    }
    properties: {
        productSummary: ProductSummary
        brandId: UUID
        price: PositiveDouble
        currency: String
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateArticle
    read: GetArticle
    update: UpdateArticle
    delete: DeleteArticle
}

@http(method: "POST", uri: "/brands/{brandId}/articles")
operation CreateArticle {
    input: CreateArticleInput
    output: CreateArticleOutput
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/brands/{brandId}/articles/{articleId}")
operation GetArticle {
    input: GetArticleInput
    output: GetArticleOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/brands/{brandId}/articles/{articleId}")
operation UpdateArticle {
    input: UpdateArticleInput
    output: UpdateArticleOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/brands/{brandId}/articles/{articleId}")
@documentation("Restricted cascading operation, references for stands should NOT exist")
operation DeleteArticle {
    input: DeleteArticleInput
    output: DeleteArticleOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        DeleteRestrictedError
        InternalServerError
    ]
}
