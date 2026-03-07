$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout#DeleteRestrictedError
use com.shopping.inandout#ImageUrl
use com.shopping.inandout#InternalServerError
use com.shopping.inandout#InvalidInputError
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceName
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout#UUID

resource Brand {
    identifiers: {
        brandId: UUID
    }
    properties: {
        name: ResourceName
        logoUrl: ImageUrl
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateBrand
    read: GetBrand
    update: UpdateBrand
    delete: DeleteBrand
}

@http(method: "POST", uri: "/brands")
operation CreateBrand {
    input: CreateBrandInput
    output: BrandSummary
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/brands/{brandId}")
operation GetBrand {
    input: GetBrandInput
    output: BrandSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/brands/{brandId}")
operation UpdateBrand {
    input: UpdateBrandInput
    output: BrandSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/brands/{brandId}")
@documentation("Restricted cascading operation, references for stores and articles should NOT exist")
operation DeleteBrand {
    input: DeleteBrandInput
    output: BrandSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        DeleteRestrictedError
        InternalServerError
    ]
}
