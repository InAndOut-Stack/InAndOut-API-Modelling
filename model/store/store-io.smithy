$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout.brand#Brand
use com.shopping.inandout.util#Description
use com.shopping.inandout.util#GeoCoordinates
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#InputPagination
use com.shopping.inandout.util#Latitude
use com.shopping.inandout.util#Longitude
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Timezone
use com.shopping.inandout.util#UUID

@references([
    {
        resource: Brand
    }
])
structure CreateStoreInput {
    name: ResourceName

    @required
    brandSlug: UUID

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

@references([
    {
        resource: Brand
    }
])
structure UpdateStoreInput {
    @required
    @httpLabel
    storeId: UUID

    name: ResourceName

    brandSlug: UUID

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
