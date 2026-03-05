$version: "2"

namespace shopping.inandout.tsp

use shopping.inandout#InternalServerError
use shopping.inandout#InvalidInputError
use shopping.inandout#ResourceNotFoundError

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
