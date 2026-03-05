$version: "2"

namespace shopping.inandout.stand

use shopping.inandout#InputPagination
use shopping.inandout#OutputPagination
use shopping.inandout#PositiveDouble
use shopping.inandout#StoreIdMixin
use shopping.inandout#UUID
use shopping.inandout.article#Article
use shopping.inandout.article#CreateArticleInput

@references([
    {
        resource: Article
    }
])
structure CreateStandInput with [StoreIdMixin] {
    @required
    edgeId: UUID

    @required
    sourceNodeDistance: PositiveDouble

    // Clients must choose between providing an article id/details.
    // Not none, not both, one field must be filled.
    @notProperty
    @documentation("Existing article referenced in a new stand")
    articleId: UUID

    @notProperty
    @documentation("Creates a new article")
    createArticleInput: CreateArticleInput
}

structure CreateStandOutput {
    @required
    standId: UUID
}

structure GetStandInput with [StoreIdMixin] {
    @required
    @httpLabel
    standId: UUID
}

structure GetStandOutput with [StandOutputMixin] {}

@references([
    {
        resource: Article
    }
])
structure ListStandsInput with [StoreIdMixin, InputPagination] {
    @httpQuery("edgeId")
    edgeId: UUID

    @httpQuery("articleId")
    articleId: UUID
}

structure ListStandsOutput with [OutputPagination] {
    @required
    tokens: StandSummaryList
}

structure UpdateStandInput with [StoreIdMixin] {
    @required
    @httpLabel
    standId: UUID

    edgeId: UUID

    sourceNodeDistance: PositiveDouble
}

structure UpdateStandOutput with [StandOutputMixin] {}

structure DeleteStandInput with [StoreIdMixin] {
    @required
    @httpLabel
    standId: UUID
}

structure DeleteStandOutput {}
