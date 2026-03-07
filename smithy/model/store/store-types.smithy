$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout#DayType
use com.shopping.inandout#Description
use com.shopping.inandout#GeoCoordinates
use com.shopping.inandout#ImageUrl
use com.shopping.inandout#OutputPagination
use com.shopping.inandout#ResourceName
use com.shopping.inandout#TimeRange
use com.shopping.inandout#Timezone
use com.shopping.inandout#UUID

map OperatingHoursMap {
    key: DayType
    value: TimeRange
}

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
