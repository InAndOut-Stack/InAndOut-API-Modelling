$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#AuditMetadata
use shopping.inandout#Description
use shopping.inandout#ImageUrl
use shopping.inandout#ResourceName
use shopping.inandout#UUID

@mixin
structure ProductMixin {
    vendor: ResourceName
    imageUrl: ImageUrl
    description: Description
}

@mixin
structure ProductInputMixin with [ProductMixin] {}

@mixin
@references([
    {
        resource: Product
    }
])
structure ProductOutputMixin with [AuditMetadata, ProductMixin] {
    @required
    productId: UUID

    @required
    name: ResourceName

    @required
    subcategory: ResourceName

    @required
    category: ResourceName
}

structure ProductSummary with [ProductOutputMixin] {}
