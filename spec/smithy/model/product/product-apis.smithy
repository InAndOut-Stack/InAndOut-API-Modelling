$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#DeleteRestrictedError
use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceName
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID

resource Product {
    identifiers: {
        productId: UUID
    }
    properties: {
        name: ResourceName
        subcategory: ResourceName
        category: ResourceName
        vendor: ResourceName
        imageUrl: ImageUrl
        description: Description
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateProduct
    read: GetProduct
    update: UpdateProduct
    delete: DeleteProduct
}

@http(method: "POST", uri: "/products")
operation CreateProduct {
    input: CreateProductInput
    output: CreateProductOutput
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/products/{productId}")
operation GetProduct {
    input: GetProductInput
    output: GetProductOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/products/{productId}")
operation UpdateProduct {
    input: UpdateProductInput
    output: UpdateProductOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/products/{productId}")
@documentation("Restricted cascading operation, references for articles should NOT exist")
operation DeleteProduct {
    input: DeleteProductInput
    output: DeleteProductOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        DeleteRestrictedError
        InternalServerError
    ]
}
