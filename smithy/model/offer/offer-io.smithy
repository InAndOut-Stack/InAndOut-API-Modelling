$version: "2"

namespace shopping.inandout.offer

use shopping.inandout#InputPagination
use shopping.inandout#OutputPagination
use shopping.inandout#Percentage
use shopping.inandout#StoreIdMixin
use shopping.inandout#UUID

structure CreateOfferInput with [StoreIdMixin, OfferInputMixin] {
    @required
    percentage: Percentage
}

structure CreateOfferOutput {
    @required
    offerId: UUID
}

structure GetOfferInput with [StoreIdMixin] {
    @required
    @httpLabel
    offerId: UUID
}

structure GetOfferOutput with [OfferOutputMixin] {}

structure ListOffersInput with [StoreIdMixin, InputPagination] {}

structure ListOffersOutput with [OutputPagination] {
    @required
    tokens: OfferSummaryList
}

structure UpdateOfferInput with [StoreIdMixin, OfferInputMixin] {
    @required
    @httpLabel
    offerId: UUID

    percentage: Percentage
}

structure UpdateOfferOutput with [OfferOutputMixin] {}

structure DeleteOfferInput with [StoreIdMixin] {
    @required
    @httpLabel
    offerId: UUID
}

structure DeleteOfferOutput {}
