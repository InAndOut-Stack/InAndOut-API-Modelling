$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug
use com.shopping.inandout.util#Timestamp

structure BrandSummary {
    @required
    brandSlug: Slug

    @required
    name: ResourceName

    logoUrl: ImageUrl

    @required
    createdAt: Timestamp

    @required
    updatedAt: Timestamp
}
