$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout#Description
use com.shopping.inandout#GeoCoordinates
use com.shopping.inandout#ImageUrl
use com.shopping.inandout#InternalServerError
use com.shopping.inandout#InvalidInputError
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceName
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout#Timezone
use com.shopping.inandout#UUID
use com.shopping.inandout.route#Route
use com.shopping.inandout.stand#Stand

resource Store {
    identifiers: {
        storeId: UUID
    }
    properties: {
        name: ResourceName
        brandId: UUID
        description: Description
        imageUrl: ImageUrl
        geoCoordinates: GeoCoordinates
        operatingHoursMap: OperatingHoursMap
        timezone: Timezone
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    resources: [
        Stand
        Route
    ]
    create: CreateStore
    read: GetStore
    list: ListStores
    update: UpdateStore
    delete: DeleteStore
}

@http(method: "POST", uri: "/api/stores")
operation CreateStore {
    input: CreateStoreInput
    output: StoreSummary
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/api/stores/{storeId}")
operation GetStore {
    input: GetStoreInput
    output: StoreSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/stores")
operation ListStores {
    input: ListStoresInput
    output: StoreSummaries
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/api/stores/{storeId}")
operation UpdateStore {
    input: UpdateStoreInput
    output: StoreSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/stores/{storeId}")
@documentation("Not restricted cascading operation, deletes floors, stands, etc.")
operation DeleteStore {
    input: DeleteStoreInput
    output: StoreSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}
