$version: "2"

namespace com.shopping.inandout

use aws.protocols#restJson1
use com.shopping.inandout.brand#Brand
use com.shopping.inandout.store#Store

@restJson1
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize", items: "tokens")
service InAndOut {
    version: "2026-04-01"
    resources: [
        Store
        Brand
    ]
}
