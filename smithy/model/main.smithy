$version: "2"

namespace com.shopping.inandout

use aws.protocols#restJson1
use com.shopping.inandout.brand#Brand
use com.shopping.inandout.store#Store
use com.shopping.inandout.tsp#FindTspSolution

@restJson1
@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize", items: "tokens")
service InAndOut {
    version: "2026-04-01"
    resources: [
        Brand
        Store
    ]
    operations: [
        FindTspSolution
    ]
}
