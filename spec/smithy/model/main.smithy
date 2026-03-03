$version: "2"

namespace shopping.inandout

use shopping.inandout.article#Article
use shopping.inandout.brand#Brand
use shopping.inandout.offer#Offer
use shopping.inandout.product#Product
use shopping.inandout.stand#Stand
use shopping.inandout.store#Store
use shopping.inandout.tsp#FindTspSolution

@paginated(inputToken: "nextToken", outputToken: "nextToken", pageSize: "pageSize", items: "tokens")
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
