$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout#DeleteRestrictedError
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#UUID
use com.shopping.inandout.util#Slug

resource Brand {
    identifiers: {
        brandSlug: Slug
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
@http(method: "GET", uri: "/api/brands/{brandSlug}")
operation GetBrand {
    input: GetBrandInput
    output: BrandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@http(method: "PATCH", uri: "/api/brands/{brandSlug}")
operation UpdateBrand {
    input: UpdateBrandInput
    output: BrandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/brands/{brandSlug}")
@documentation("Restricted cascading operation, references for stores and articles should NOT exist")
operation DeleteBrand {
    input: DeleteBrandInput
    output: BrandSummary
    errors: [
        DeleteRestrictedError
    ]
}
