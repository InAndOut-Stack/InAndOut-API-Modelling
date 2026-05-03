$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.util#ID
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#Timestamp
use com.shopping.inandout.util#UUID

resource Stand {
    identifiers: {
        brandSlug: Slug
        storeId: UID
        standId: ID
    }
    properties: {
        articleSlug: Slug
        edgeId: ID
        price: Price
        sourceNodeDistance: PositiveDouble
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateStand
    read: GetStand
    list: ListStands
    update: UpdateStand
    delete: DeleteStand
}

@http(method: "POST", uri: "/api/brands/{brandSlug}/stores/{storeId}/stands")
operation CreateStand {
    input: CreateStandInput
    output: StandSummary
    errors: [
        ResourceAlreadyExistsError
        ResourceNotFoundError
    ]
}

@readonly
@http(method: "GET", uri: "/api/brands/{brandSlug}/stores/{storeId}/stands/{standId}")
operation GetStand {
    input: GetStandInput
    output: StandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/brands/{brandSlug}/stores/{storeId}/stands")
operation ListStands {
    input: ListStandsInput
    output: StandSummaries
    errors: [
        ResourceNotFoundError
    ]
}

@http(method: "PATCH", uri: "/api/brands/{brandSlug}/stores/{storeUid}/stands/{standId}")
operation UpdateStand {
    input: UpdateStandInput
    output: StandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/brands/{brandSlug}/stores/{storeUid}/stands/{standId}")
operation DeleteStand {
    input: DeleteStandInput
    output: StandSummary
}
