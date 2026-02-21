$version: "2"

namespace shopping.inandout.catalog.stand

use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#PositiveDouble
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#UUID
use shopping.inandout.catalog.article#ArticleSummary

resource Stand {
    identifiers: {
        standId: UUID
    }
    properties: {
        edgeId: UUID
        sourceNodeDistance: PositiveDouble
        articleSummary: ArticleSummary
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
    output: CreateStandOutput
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
    output: GetStandOutput
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
    output: ListStandsOutput
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/stores/{storeId}/stands/{standId}")
operation UpdateStand {
    input: UpdateStandInput
    output: UpdateStandOutput
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
    output: DeleteStandOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}
