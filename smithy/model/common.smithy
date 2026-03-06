$version: "2"

namespace com.shopping.inandout

@pattern("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")
@length(min: 36, max: 36)
string UUID

list UUIDList {
    member: UUID
}
