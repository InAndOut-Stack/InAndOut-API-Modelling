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
