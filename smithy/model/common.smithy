$version: "2"

namespace com.shopping.inandout

@pattern("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$")
@length(min: 36, max: 36)
string UUID

list UUIDList {
    member: UUID
}
