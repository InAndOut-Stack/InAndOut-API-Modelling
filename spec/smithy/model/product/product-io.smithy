$version: "2"

namespace shopping.inandout.catalog.product

use shopping.inandout#ResourceName
use shopping.inandout#UUID

structure CreateProductInput with [ProductInputMixin] {
    @required
    name: ResourceName

    @required
    subcategory: ResourceName

    @required
    category: ResourceName
}

structure CreateProductOutput {
    @required
    productId: UUID
}

structure GetProductInput {
    @required
    @httpLabel
    productId: UUID
}

structure GetProductOutput with [ProductOutputMixin] {}

structure UpdateProductInput with [ProductInputMixin] {
    @required
    @httpLabel
    productId: UUID

    name: ResourceName

    subcategory: ResourceName

    category: ResourceName
}

structure UpdateProductOutput with [ProductOutputMixin] {}

structure DeleteProductInput {
    @required
    @httpLabel
    productId: UUID
}

structure DeleteProductOutput {}
