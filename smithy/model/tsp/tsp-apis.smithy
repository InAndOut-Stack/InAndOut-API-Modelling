$version: "2"

namespace com.shopping.inandout.tsp

use com.shopping.inandout#InternalServerError
use com.shopping.inandout#InvalidInputError
use com.shopping.inandout#ResourceNotFoundError

@http(method: "POST", uri: "/tsp")
@documentation("Travelling salesman problem solution creation/retrieval operation")
operation FindTspSolution {
    input: FindTspSolutionInput
    output: FindTspSolutionOutput
    errors: [
        InvalidInputError
        ResourceNotFoundError
        InternalServerError
    ]
}
