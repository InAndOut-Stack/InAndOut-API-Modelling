$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout#ImageUrl
use com.shopping.inandout#ResourceName
use com.shopping.inandout#UUID

structure BrandSummary {
    @required
    @resourceIdentifier("brandId")
    brandId: UUID

    @required
    name: ResourceName

    logoUrl: ImageUrl

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}
