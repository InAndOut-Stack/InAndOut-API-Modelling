$version: "2"

namespace shopping.inandout.offer

use shopping.inandout#NaturalNumber
use shopping.inandout#Percentage
use shopping.inandout#ResourceAlreadyExistsError
use shopping.inandout#ResourceNotFoundError
use shopping.inandout#TimeRange
use shopping.inandout.util#UIDList
use shopping.inandout.util#Slug

resource Offer {
    identifiers: {
        brandSlug: Slug
        offerId: ID
    }
    properties: {
        percentage: Percentage
        storeIdList: UIDList
        articleSlugList: SlugList
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

@http(method: "POST", uri: "/api/brands/{brandSlug}/offers")
operation CreateOffer {
    input: CreateOfferInput
    output: OfferSummary
    errors: [
        ResourceAlreadyExistsError
    ]
}

@readonly
@http(method: "GET", uri: "/api/brands/{brandSlug}/offers/{offerId}")
operation GetOffer {
    input: GetOfferInput
    output: OfferSummary
    errors: [
        ResourceNotFoundError
    ]
}

@readonly
@paginated
@http(method: "GET", uri: "/api/brands/{brandSlug}/offers")
operation ListOffers {
    input: ListOffersInput
    output: OfferSummaries
}

@http(method: "PATCH", uri: "/api/brands/{brandSlug}/offers/{offerId}")
@documentation("Non-idempotent cascading operation, creates/deletes internal resources as needed")
operation UpdateOffer {
    input: UpdateOfferInput
    output: OfferSummary
    errors: [
        ResourceNotFoundError
    ]
}

@idempotent
@http(method: "DELETE", uri: "/api/brands/{brandSlug}/offers/{offerId}")
@documentation("Not restricted cascading operation, deletes discounts, dependencies, etc.")
operation DeleteOffer {
    input: DeleteOfferInput
    output: OfferSummary
}
