$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout.util#DayType
use com.shopping.inandout.util#Description
use com.shopping.inandout.util#GeoCoordinates
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#OutputPagination
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#TimeRange
use com.shopping.inandout.util#Timezone
use com.shopping.inandout.util#UID

map OperatingHoursMap {
    key: DayType
    value: TimeRange
}

structure StoreSummary {
    @required
    brandSlug: Slug

    @required
    storeId: UID

    name: ResourceName

    description: Description

    imageUrl: ImageUrl

    currency: Currency

    geoCoordinates: GeoCoordinates

    operatingHoursMap: OperatingHoursMap

    timezone: Timezone

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}

list StoreSummaryList {
    member: StoreSummary
}

// This is needed since lists or other similar collections can not be used as input/output for operations.
structure StoreSummaries with [OutputPagination] {
    tokens: StoreSummaryList
}
