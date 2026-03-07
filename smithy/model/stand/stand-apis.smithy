$version: "2"

namespace com.shopping.inandout.stand

use com.shopping.inandout#UUID

resource Stand {
    identifiers: {
        storeId: UUID
        standId: UUID
    }
    properties: {}
}
