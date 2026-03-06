$version: "2"

namespace com.shopping.inandout

@pattern("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$")
@length(min: 32, max: 32)
string UUID

list UUIDList {
    member: UUID
}
