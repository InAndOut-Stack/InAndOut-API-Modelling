$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout.util#Currency
use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#Slug

structure CreateBrandInput {
    @required
    name: ResourceName

    logoUrl: ImageUrl

    currency: Currency
}

structure GetBrandInput {
    @required
    @httpLabel
    brandSlug: Slug
}

structure UpdateBrandInput {
    @required
    @httpLabel
    brandSlug: Slug

    name: ResourceName

    logoUrl: ImageUrl

    currency: Currency
}

structure DeleteBrandInput {
    @required
    @httpLabel
    brandSlug: Slug
}
