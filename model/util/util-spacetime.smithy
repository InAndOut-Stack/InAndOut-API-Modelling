$version: "2"

namespace com.shopping.inandout.util

// ----------------------------
// Location related structures
// ----------------------------
@range(min: -180, max: 180)
double Longitude

@range(min: -90, max: 90)
double Latitude

structure GeoCoordinates {
    @required
    longitude: Longitude

    @required
    latitude: Latitude
}

// ----------------------------
// Time related structures
// ----------------------------
enum DayType {
    MON = "MON"
    TUE = "TUE"
    WED = "WED"
    THU = "THU"
    FRI = "FRI"
    SAT = "SAT"
    SUN = "SUN"
}

// All UTC offsets fall between this interval: [-12, 14].
// Doubles are better suited since zones like `UTC+12:45` exist.
// See: https://en.wikipedia.org/wiki/List_of_UTC_offsets.
@range(min: -12, max: 14)
@documentation("UTC offsets for various globe zones")
double Timezone

@range(min: 0, max: 59)
integer Minute

@range(min: 0, max: 23)
integer Hour

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
