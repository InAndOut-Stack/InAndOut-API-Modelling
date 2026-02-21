$version: "2"

namespace shopping.inandout

use shopping.inandout.catalog.article#Article
use shopping.inandout.catalog.product#Product
use shopping.inandout.catalog.stand#Stand
use shopping.inandout.marketing.offer#Offer
use shopping.inandout.outlet.brand#Brand
use shopping.inandout.outlet.store#Store
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
