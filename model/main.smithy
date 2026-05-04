$version: "2"

namespace com.shopping.inandout

use aws.protocols#restJson1
use com.shopping.inandout.brand#Brand
use com.shopping.inandout.route#Route
use com.shopping.inandout.stand#Stand

@mixin
@restJson1
service InAndOut {
    version: "0.0.1"
    errors: [
        InvalidInputError
        InternalServerError
    ]
}

service RouteService with [InAndOut] {
    resources: [
        Route
    ]
}

@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize", items: "tokens")
service MappingService with [InAndOut] {
    resources: [
        Stand
    ]
}

@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize", items: "tokens")
@documentation("Brands, Stores, Articles, Offers.")
service BusinessService with [InAndOut] {
    resources: [
        Brand
    ]
}
