$version: "2"

namespace shopping.inandout.store

use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#Latitude
use shopping.inandout#Longitude
use shopping.inandout#NaturalNumber
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceName
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UTCTimezone
use shopping.inandout#UUID
use shopping.inandout.brand#BrandSummary

resource Store {
    identifiers: {
        storeId: UUID
    }
    properties: {
        name: ResourceName
        brandSummary: BrandSummary
        description: Description
        imageUrl: ImageUrl
        timezone: UTCTimezone
        operatingHoursMap: OperatingHoursMap
        locationMapping: LocationMapping
        mappingVersion: NaturalNumber
        longitude: Longitude
        latitude: Latitude
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateStore
    read: GetStore
    list: ListStores
    update: UpdateStore
    delete: DeleteStore
}

@http(method: "POST", uri: "/stores")
operation CreateStore {
    input: CreateStoreInput
    output: CreateStoreOutput
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/stores/{storeId}")
@documentation("Returns additional brand details in order to avoid multiple network round-trips")
operation GetStore {
    input: GetStoreInput
    output: GetStoreOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/stores")
@documentation("Returns additional brand details in order to avoid multiple network round-trips")
operation ListStores {
    input: ListStoresInput
    output: ListStoresOutput
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/stores/{storeId}")
@documentation("Non-idempotent cascading operation, creates/deletes internal resources as needed")
operation UpdateStore {
    input: UpdateStoreInput
    output: UpdateStoreOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/stores/{storeId}")
@documentation("Not restricted cascading operation, deletes floors, stands, etc.")
operation DeleteStore {
    input: DeleteStoreInput
    output: DeleteStoreOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}
