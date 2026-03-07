$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout#Description
use com.shopping.inandout#GeoCoordinates
use com.shopping.inandout#ImageUrl
use com.shopping.inandout#InputPagination
use com.shopping.inandout#Latitude
use com.shopping.inandout#Longitude
use com.shopping.inandout#PositiveDouble
use com.shopping.inandout#ResourceName
use com.shopping.inandout#Timezone
use com.shopping.inandout#UUID

structure CreateStoreInput {
    name: ResourceName

    @required
    brandId: UUID

    description: Description

    imageUrl: ImageUrl

    timezone: Timezone

    operatingHoursMap: OperatingHoursMap

    geoCoordinates: GeoCoordinates
}

structure GetStoreInput {
    @required
    @httpLabel
    storeId: UUID
}

@documentation("Retrieve a list of stores based on the provided queries")
structure ListStoresInput with [InputPagination] {
    @httpQuery("name")
    name: ResourceName

    @httpQuery("isOpen")
    isOpen: Boolean

    @httpQuery("userLongitude")
    userLongitude: Longitude

    @httpQuery("userLatitude")
    userLatitude: Latitude

    // ! User location must be provided in order for the below queries to work.
    @httpQuery("maxDistance")
    @documentation("Distance measured in kilometers")
    maxDistance: PositiveDouble
}

structure UpdateStoreInput {
    @required
    @httpLabel
    storeId: UUID

    name: ResourceName

    brandId: UUID

    description: Description

    imageUrl: ImageUrl

    timezone: Timezone

    operatingHoursMap: OperatingHoursMap

    geoCoordinates: GeoCoordinates
}

structure DeleteStoreInput {
    @required
    @httpLabel
    storeId: UUID
}
