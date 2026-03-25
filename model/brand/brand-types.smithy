$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#UUID

structure BrandSummary {
    @required
    brandId: UUID

    @required
    name: ResourceName

    logoUrl: ImageUrl

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}
