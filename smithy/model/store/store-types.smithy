$version: "2"

namespace com.shopping.inandout.store

use com.shopping.inandout#DayType
use com.shopping.inandout#Description
use com.shopping.inandout#ImageUrl
use com.shopping.inandout#Latitude
use com.shopping.inandout#Longitude
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
    name: ResourceName
    brandId: UUID
    description: Description
    imageUrl: ImageUrl
    timezone: Timezone
    operatingHoursMap: OperatingHoursMap
    longitude: Longitude
    latitude: Latitude
    createdAt: Timestamp
    updatedAt: Timestamp
}

list StoreSummaryList {
    member: StoreSummary
}

// This is needed since lists or other similar collections can not be used as input/output for operations.
structure StoreSummaries with [OutputPagination] {
    tokens: StoreSummaryList
}
