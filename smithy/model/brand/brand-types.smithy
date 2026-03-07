$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout#ImageUrl
use com.shopping.inandout#ResourceName

structure BrandSummary {
    @required
    name: ResourceName

    logoUrl: ImageUrl

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}
