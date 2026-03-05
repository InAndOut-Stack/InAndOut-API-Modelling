$version: "2"

namespace shopping.inandout.brand

use shopping.inandout#ResourceName
use shopping.inandout#UUID

structure CreateBrandInput with [BrandInputMixin] {
    @required
    name: ResourceName
}

structure CreateBrandOutput {
    @required
    brandId: UUID
}

structure GetBrandInput {
    @required
    @httpLabel
    brandId: UUID
}

structure GetBrandOutput with [BrandOutputMixin] {}

structure UpdateBrandInput with [BrandInputMixin] {
    @required
    @httpLabel
    brandId: UUID

    name: ResourceName
}

structure UpdateBrandOutput with [BrandOutputMixin] {}

structure DeleteBrandInput {
    @required
    @httpLabel
    brandId: UUID
}

structure DeleteBrandOutput {}
