$version: "2"

namespace shopping.inandout.brand

use shopping.inandout#AuditMetadata
use shopping.inandout#ImageUrl
use shopping.inandout#ResourceName
use shopping.inandout#UUID

@mixin
structure BrandMixin {
    logoUrl: ImageUrl
}

@mixin
structure BrandInputMixin with [BrandMixin] {}

@mixin
@references([
    {
        resource: Brand
    }
])
structure BrandOutputMixin with [AuditMetadata, BrandMixin] {
    @required
    brandId: UUID

    @required
    name: ResourceName
}

structure BrandSummary with [BrandOutputMixin] {}
