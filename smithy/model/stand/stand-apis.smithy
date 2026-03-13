$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout#InternalServerError
use com.shopping.inandout#InvalidInputError
use com.shopping.inandout#PositiveDouble
use com.shopping.inandout#Price
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout#UUID

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

@http(method: "POST", uri: "/stores/{storeId}/stands")
operation CreateStand {
    input: CreateStandInput
    output: StandSummary
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/stores/{storeId}/stands/{standId}")
operation GetStand {
    input: GetStandInput
    output: StandSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/stores/{storeId}/stands")
operation ListStands {
    input: ListStandsInput
    output: StandSummaries
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/stores/{storeId}/stands/{standId}")
operation UpdateStand {
    input: UpdateStandInput
    output: StandSummary
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/stores/{storeId}/stands/{standId}")
operation DeleteStand {
    input: DeleteStandInput
    output: StandSummary
    errors: [
        InvalidInputError
        InternalServerError
    ]
}
