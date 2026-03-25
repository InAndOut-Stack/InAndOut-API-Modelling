$version: "2"

namespace com.shopping.inandout.util

@mixin
@documentation("Parameters sent by the client to control pagination of the list results")
structure InputPagination {
    @httpQuery("nextToken")
    @documentation("An id used to retrieve the next page of results; leave empty for the first request")
    nextToken: String

    @httpQuery("pageSize")
    @default(100)
    @documentation("The maximum number of items the client is requesting to be returned in this page")
    pageSize: NaturalNumber
}

@mixin
@documentation("Metadata returned to the client to assist in navigating paginated results")
structure OutputPagination {
    @documentation("An id to be passed in the subsequent request to retrieve the next page; null if no more pages exist")
    nextToken: String

    @required
    @documentation("The actual number of items returned in the current response page.")
    tokenCount: NaturalNumber
}
