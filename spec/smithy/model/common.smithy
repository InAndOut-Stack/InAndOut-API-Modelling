$version: "2"

namespace shopping.inandout

use shopping.inandout.outlet.brand#Brand
use shopping.inandout.outlet.store#Store

@pattern("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$")
@length(min: 32, max: 32)
string UUID

@pattern("^[a-zA-Z0-9\\- ]+$")
@length(min: 3, max: 63)
string ResourceName

@pattern("^https?://[a-zA-Z0-9\\-._~:/?#\\[\\]@!$&'()*+,;=%]+\\.(jpg|jpeg|png|gif)$")
@length(min: 8, max: 255)
string ImageUrl

@pattern("^[a-zA-Z0-9\\-, ]+$")
@length(min: 8, max: 255)
string Description

// All UTC offsets fall between this interval: [-12, 14].
// See: https://en.wikipedia.org/wiki/List_of_UTC_offsets.
@range(min: -12, max: 14)
integer UTCTimezone

@range(min: 0, max: 59)
integer Minute

@range(min: 0, max: 23)
integer Hour

@range(min: -180, max: 180)
double Longitude

@range(min: -90, max: 90)
double Latitude

@range(min: 0, max: 100)
double Percentage

@range(min: 0)
integer NaturalNumber

@range(min: 0)
double PositiveDouble

enum DayType {
    MON = "MON"
    TUE = "TUE"
    WED = "WED"
    THU = "THU"
    FRI = "FRI"
    SAT = "SAT"
    SUN = "SUN"
}

list UUIDList {
    member: UUID
}

structure Time {
    @required
    hour: Hour

    @required
    minute: Minute
}

structure TimeRange {
    @required
    begin: Time

    @required
    end: Time
}

@mixin
structure AuditMetadata {
    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}

@mixin
@documentation("Parameters sent by the client to control pagination of the list results")
structure InputPagination {
    @httpQuery("nextToken")
    @documentation("An id used to retrieve the next page of results; leave empty for the first request")
    nextToken: String

    @httpQuery("pageSize")
    @default(100)
    @documentation("The maximum number of items the client is requesting to be returned in this page")
    pageSize: NaturalNumber
}

@mixin
@documentation("Metadata returned to the client to assist in navigating paginated results")
structure OutputPagination {
    @documentation("An id to be passed in the subsequent request to retrieve the next page; null if no more pages exist")
    nextToken: String

    @required
    @documentation("The actual number of items returned in the current response page.")
    tokenCount: NaturalNumber
}

// The below mixins are used for uri labels poiting to external resources.
// Internal entity used in offer/stand operations' input structures.
@mixin
@references([
    {
        resource: Store
    }
])
@documentation("Internal helper structure used to diminish the verbosity of the storeId field")
structure StoreIdMixin {
    @required
    @httpLabel
    storeId: UUID
}

// Internal entity used in article operations' input structures.
@mixin
@references([
    {
        resource: Brand
    }
])
@documentation("Internal helper structure used to diminish the verbosity of the brandId field")
structure BrandIdMixin {
    @required
    @httpLabel
    brandId: UUID
}
