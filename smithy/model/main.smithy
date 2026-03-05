$version: "2"

namespace com.shopping.inandout

use aws.protocols#restJson1
use shopping.inandout.tsp#FindTspSolution
use shopping.inandout.article#Article
use shopping.inandout.brand#Brand
use shopping.inandout.offer#Offer
use shopping.inandout.product#Product
use shopping.inandout.stand#Stand
use shopping.inandout.store#Store
use shopping.inandout.tsp#FindTspSolution

@restJson1
service InAndOut {
    version: "2026-04-01"
    resources: [
        Store
        Brand
        Stand
        Article
        Product
        Offer
    ]
    operations: [
        FindTspSolution
    ]
}
