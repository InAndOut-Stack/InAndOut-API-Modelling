$version: "2"

namespace shopping.inandout.outlet.brand

use shopping.inandout#DeleteRestrictedError
use shopping.inandout#ImageUrl
use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceName
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID

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
    output: CreateBrandOutput
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
    output: GetBrandOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/brands/{brandId}")
operation UpdateBrand {
    input: UpdateBrandInput
    output: UpdateBrandOutput
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
    output: DeleteBrandOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        DeleteRestrictedError
        InternalServerError
    ]
}
