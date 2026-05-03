$version: "2"

namespace com.shopping.inandout.offer

use com.shopping.inandout#NaturalNumber
use com.shopping.inandout#Percentage
use com.shopping.inandout#ResourceAlreadyExistsError
use com.shopping.inandout#ResourceNotFoundError
use com.shopping.inandout#TimeRange
use com.shopping.inandout.util#UIDList
use com.shopping.inandout.util#Slug

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
