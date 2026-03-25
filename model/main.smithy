$version: "2"

namespace com.shopping.inandout

use aws.protocols#restJson1
use com.shopping.inandout.brand#Brand
use com.shopping.inandout.route#Route
use com.shopping.inandout.stand#Stand
use com.shopping.inandout.store#Store

@mixin
@restJson1
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize", items: "tokens")
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

service MappingService with [InAndOut] {
    resources: [
        Stand
    ]
}

service BusinessService with [InAndOut] {
    resources: [
        Store
        Brand
    ]
}
