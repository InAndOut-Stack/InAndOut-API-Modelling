$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout.util#Currency
use com.shopping.inandout.util#Description
use com.shopping.inandout.util#GeoCoordinates
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#InputPagination
use com.shopping.inandout.util#Latitude
use com.shopping.inandout.util#Longitude
use com.shopping.inandout.util#PositiveDouble
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#Timezone
use com.shopping.inandout.util#UID

structure CreateStoreInput {
    @required
    @httpLabel
    brandSlug: Slug

    name: ResourceName

    description: Description

    imageUrl: ImageUrl

    currency: Currency

    timezone: Timezone

    operatingHoursMap: OperatingHoursMap

    geoCoordinates: GeoCoordinates
}

structure GetStoreInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID
}

structure ListStoresInput with [InputPagination] {
    @required
    @httpLabel
    brandSlug: Slug

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
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID

    name: ResourceName

    description: Description

    imageUrl: ImageUrl

    currency: Currency

    timezone: Timezone

    operatingHoursMap: OperatingHoursMap

    geoCoordinates: GeoCoordinates
}

structure DeleteStoreInput {
    @required
    @httpLabel
    brandSlug: Slug

    @required
    @httpLabel
    storeId: UID
}
