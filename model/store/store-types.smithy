$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout.brand#Brand
use com.shopping.inandout.util#DayType
use com.shopping.inandout.util#Description
use com.shopping.inandout.util#GeoCoordinates
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#OutputPagination
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#TimeRange
use com.shopping.inandout.util#Timezone
use com.shopping.inandout.util#UUID

map OperatingHoursMap {
    key: DayType
    value: TimeRange
}

@references([
    {
        resource: Brand
    }
])
structure StoreSummary {
    @required
    storeId: UUID

    name: ResourceName

    @required
    brandId: UUID

    description: Description

    imageUrl: ImageUrl

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
