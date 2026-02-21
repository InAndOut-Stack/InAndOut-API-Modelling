$version: "2"

namespace shopping.inandout.outlet.store

use shopping.inandout#AuditMetadata
use shopping.inandout#DayType
use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#Latitude
use shopping.inandout#Longitude
use shopping.inandout#NaturalNumber
use shopping.inandout#ResourceName
use shopping.inandout#TimeRange
use shopping.inandout#UTCTimezone
use shopping.inandout#UUID
use shopping.inandout.outlet.brand#BrandSummary

map OperatingHoursMap {
    key: DayType
    value: TimeRange
}

structure LocationMapping {
    floorList: FloorList
}

list FloorList {
    member: Floor
}

structure Floor {
    @required
    floorId: UUID

    @required
    level: Byte

    edgeList: EdgeList
}

list EdgeList {
    member: Edge
}

structure Edge {
    @required
    sourceNode: Node

    @required
    targetNode: Node

    name: ResourceName

    weight: Double
}

structure Node {
    @required
    name: ResourceName

    type: NodeType
}

enum NodeType {
    NAVIGATION = "NAVIGATION"
    ELEVATION = "ELEVATION"
    DESCENT = "DESCENT"
}

@mixin
structure StoreMixin {
    description: Description
    imageUrl: ImageUrl
    timezone: UTCTimezone
    operatingHoursMap: OperatingHoursMap
    longitude: Longitude
    latitude: Latitude
}

@mixin
structure StoreInputMixin with [StoreMixin] {
    name: ResourceName
    locationMapping: LocationMapping
}

@mixin
@documentation("Retrieves store and its associated brand details")
structure StoreOutputMixin with [AuditMetadata, StoreMixin] {
    @required
    storeId: UUID

    @required
    name: ResourceName

    @required
    brandSummary: BrandSummary

    @required
    mappingVersion: NaturalNumber
}

// Needed for the list method.
structure StoreSummary with [StoreOutputMixin] {}

list StoreSummaryList {
    member: StoreSummary
}
