$version: "2"

namespace shopping.inandout.offer

use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#NaturalNumber
use shopping.inandout#Percentage
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#TimeRange
use shopping.inandout#UUID
use shopping.inandout#UUIDList

// Does NOT contain the store data, only its id is necessary for logical grouping.
resource Offer {
    identifiers: {
        offerId: UUID
    }
    properties: {
        storeId: UUID
        percentage: Percentage
        articleIdList: UUIDList
        dependencyList: DependencyList
        timeRange: TimeRange
        lifetime: NaturalNumber
        createdAt: Timestamp
        updatedAt: Timestamp
    }
    create: CreateOffer
    read: GetOffer
    list: ListOffers
    update: UpdateOffer
    delete: DeleteOffer
}

@http(method: "POST", uri: "/stores/{storeId}/offers")
operation CreateOffer {
    input: CreateOfferInput
    output: CreateOfferOutput
    errors: [
        InvalidInputError
        ResourceAlreadyExistsError
        InternalServerError
    ]
}

@readonly
@http(method: "GET", uri: "/stores/{storeId}/offers/{offerId}")
operation GetOffer {
    input: GetOfferInput
    output: GetOfferOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/stores/{storeId}/offers")
operation ListOffers {
    input: ListOffersInput
    output: ListOffersOutput
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

@http(method: "PATCH", uri: "/stores/{storeId}/offers/{offerId}")
@documentation("Non-idempotent cascading operation, creates/deletes internal resources as needed")
operation UpdateOffer {
    input: UpdateOfferInput
    output: UpdateOfferOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/stores/{storeId}/offers/{offerId}")
@documentation("Not restricted cascading operation, deletes discounts, dependencies, etc.")
operation DeleteOffer {
    input: DeleteOfferInput
    output: DeleteOfferOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}
