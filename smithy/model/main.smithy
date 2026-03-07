$version: "2"

namespace com.shopping.inandout

use aws.protocols#restJson1
use com.shopping.inandout.brand#Brand
use com.shopping.inandout.tsp#FindTspSolution

@restJson1
service InAndOut {
    version: "2026-04-01"
    resources: [
        Brand
    ]
    operations: [
        FindTspSolution
    ]
}
