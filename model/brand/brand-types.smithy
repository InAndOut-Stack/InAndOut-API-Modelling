$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout.util#Currency
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug

structure BrandSummary {
    @required
    brandSlug: Slug

    @required
    name: ResourceName

    logoUrl: ImageUrl

    currency: Currency

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}
