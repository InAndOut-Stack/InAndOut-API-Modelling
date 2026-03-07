$version: "2"

namespace com.shopping.inandout.brand

use com.shopping.inandout#ImageUrl
use com.shopping.inandout#ResourceName
use com.shopping.inandout#UUID

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
