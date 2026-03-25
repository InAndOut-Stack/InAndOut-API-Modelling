$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout#DeleteRestrictedError
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#UUID

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

@http(method: "POST", uri: "/api/brands")
operation CreateBrand {
    input: CreateBrandInput
    output: BrandSummary
    errors: [
        ResourceAlreadyExistsError
    ]
}

@readonly
@http(method: "GET", uri: "/api/brands/{brandId}")
operation GetBrand {
    input: GetBrandInput
    output: BrandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@http(method: "PATCH", uri: "/api/brands/{brandId}")
operation UpdateBrand {
    input: UpdateBrandInput
    output: BrandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/brands/{brandId}")
@documentation("Restricted cascading operation, references for stores and articles should NOT exist")
operation DeleteBrand {
    input: DeleteBrandInput
    output: BrandSummary
    errors: [
        DeleteRestrictedError
    ]
}
