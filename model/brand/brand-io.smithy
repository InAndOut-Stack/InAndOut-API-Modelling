$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout.util#ImageUrl
use com.shopping.inandout.util#ResourceName
use com.shopping.inandout.util#UUID

structure CreateBrandInput {
    @required
    name: ResourceName

    logoUrl: ImageUrl
}

structure GetBrandInput {
    @required
    @httpLabel
    brandId: UUID
}

structure UpdateBrandInput {
    @required
    @httpLabel
    brandId: UUID

    name: ResourceName

    logoUrl: ImageUrl
}

structure DeleteBrandInput {
    @required
    @httpLabel
    brandId: UUID
}
