$version: "2"

namespace shopping.inandout.outlet.store

use shopping.inandout#InputPagination
use shopping.inandout#Latitude
use shopping.inandout#Longitude
use shopping.inandout#NaturalNumber
use shopping.inandout#OutputPagination
use shopping.inandout#ResourceName
use shopping.inandout#UUID
use shopping.inandout.outlet.brand#Brand

// The creation of the brand is independent of the creation of the store.
@references([
    {
        resource: Brand
    }
])
structure CreateStoreInput with [StoreInputMixin] {
    @required
    @notProperty
    brandId: UUID
}

structure CreateStoreOutput {
    @required
    storeId: UUID
}

structure GetStoreInput {
    @required
    @httpLabel
    storeId: UUID
}

structure GetStoreOutput with [StoreOutputMixin] {}

@documentation("Retrieve a list of stores based on the provided queries")
structure ListStoresInput with [InputPagination] {
    @httpQuery("name")
    name: ResourceName

    @httpQuery("userLongitude")
    userLongitude: Longitude

    @httpQuery("userLatitude")
    userLatitude: Latitude

    // ! User location must be provided in order for the below queries to work.
    @httpQuery("isOpen")
    @documentation("Based on user location, his timezone is computed and then the list of open markets")
    isOpen: Boolean

    @httpQuery("maxDistance")
    @documentation("Distance measured in kilometers")
    maxDistance: NaturalNumber
}

structure ListStoresOutput with [OutputPagination] {
    @required
    tokens: StoreSummaryList
}

structure UpdateStoreInput with [StoreInputMixin] {
    @required
    @httpLabel
    storeId: UUID
}

structure UpdateStoreOutput with [StoreOutputMixin] {}

structure DeleteStoreInput {
    @required
    @httpLabel
    storeId: UUID
}

structure DeleteStoreOutput {}
