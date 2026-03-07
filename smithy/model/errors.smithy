$version: "2"

namespace com.shopping.inandout

@error("client")
@httpError(400)
structure InvalidInputError {
    @required
    message: String
}

@error("client")
@httpError(404)
structure ResourceNotFoundError {
    @required
    message: String
}

@error("client")
@httpError(409)
structure ResourceAlreadyExistsError {
    @required
    message: String
}

@error("client")
@httpError(409)
structure DeleteRestrictedError {
    @required
    message: String
}

@error("server")
@httpError(500)
structure InternalServerError {
    @required
    message: String
}
