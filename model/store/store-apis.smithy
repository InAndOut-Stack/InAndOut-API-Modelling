$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.stand#Stand
use com.shopping.inandout.util#Currency
use com.shopping.inandout.util#Description
use com.shopping.inandout.util#GeoCoordinates
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#Timezone
use com.shopping.inandout.util#UID

resource Store {
    identifiers: {
        brandSlug: Slug
        storeId: UID
    }
    properties: {
        name: ResourceName
        description: Description
        imageUrl: ImageUrl
        currency: Currency
        geoCoordinates: GeoCoordinates
        operatingHoursMap: OperatingHoursMap
        timezone: Timezone
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    resources: [
        Route
        Stand
    ]
    create: CreateStore
    read: GetStore
    list: ListStores
    update: UpdateStore
    delete: DeleteStore
}

@http(method: "POST", uri: "/api/brands/{brandSlug}/stores")
operation CreateStore {
    input: CreateStoreInput
    output: StoreSummary
    errors: [
        ResourceAlreadyExistsError
        ResourceNotFoundError
    ]
}

@readonly
@http(method: "GET", uri: "/api/brands/{brandSlug}/stores/{storeId}")
operation GetStore {
    input: GetStoreInput
    output: StoreSummary
    errors: [
        ResourceNotFoundError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/brands/{brandSlug}/stores")
operation ListStores {
    input: ListStoresInput
    output: StoreSummaries
    errors: [
        ResourceNotFoundError
    ]
}

@http(method: "PATCH", uri: "/api/brands/{brandSlug}/stores/{storeId}")
operation UpdateStore {
    input: UpdateStoreInput
    output: StoreSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/brands/{brandSlug}/stores/{storeId}")
@documentation("Not restricted cascading operation, deletes floors, stands, etc.")
operation DeleteStore {
    input: DeleteStoreInput
    output: StoreSummary
    errors: [
        ResourceNotFoundError
    ]
}
