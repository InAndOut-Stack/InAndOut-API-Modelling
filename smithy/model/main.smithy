$version: "2"

namespace com.shopping.inandout

use com.shopping.inandout.tsp#FindTspSolution
use aws.protocols#restJson1

@restJson1
service InAndOut {
    version: "2026-04-01"
    operations: [
        FindTspSolution
    ]
}
