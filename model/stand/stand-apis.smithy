$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#Price
use com.shopping.inandout.util#UUID

resource Stand {
    identifiers: {
        storeId: UUID
        standId: UUID
    }
    properties: {
        articleId: UUID
        edgeId: UUID
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

@http(method: "POST", uri: "/api/stores/{storeId}/stands")
operation CreateStand {
    input: CreateStandInput
    output: StandSummary
    errors: [
        ResourceAlreadyExistsError
    ]
}

@readonly
@http(method: "GET", uri: "/api/stores/{storeId}/stands/{standId}")
operation GetStand {
    input: GetStandInput
    output: StandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/stores/{storeId}/stands")
operation ListStands {
    input: ListStandsInput
    output: StandSummaries
}

@http(method: "PATCH", uri: "/api/stores/{storeId}/stands/{standId}")
operation UpdateStand {
    input: UpdateStandInput
    output: StandSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/stores/{storeId}/stands/{standId}")
operation DeleteStand {
    input: DeleteStandInput
    output: StandSummary
}
