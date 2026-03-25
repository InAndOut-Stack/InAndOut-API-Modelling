$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.stand#Stand
use com.shopping.inandout.util#Description
use com.shopping.inandout.util#GeoCoordinates
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Timezone
use com.shopping.inandout.util#UUID

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
        ResourceAlreadyExistsError
    ]
}

@readonly
@http(method: "GET", uri: "/api/stores/{storeId}")
operation GetStore {
    input: GetStoreInput
    output: StoreSummary
    errors: [
        ResourceNotFoundError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/stores")
operation ListStores {
    input: ListStoresInput
    output: StoreSummaries
}

@http(method: "PATCH", uri: "/api/stores/{storeId}")
operation UpdateStore {
    input: UpdateStoreInput
    output: StoreSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/stores/{storeId}")
@documentation("Not restricted cascading operation, deletes floors, stands, etc.")
operation DeleteStore {
    input: DeleteStoreInput
    output: StoreSummary
    errors: [
        ResourceNotFoundError
    ]
}
