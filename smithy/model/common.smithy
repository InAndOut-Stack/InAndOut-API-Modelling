$version: "2"

namespace com.shopping.inandout

@pattern("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")
@length(min: 36, max: 36)
string UUID

list UUIDList {
    member: UUID
}

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
resource AuditedResource {
    properties: {
        createdAt: Timestamp
        updatedAt: Timestamp
    }
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
