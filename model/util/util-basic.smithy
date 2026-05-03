$version: "2"

namespace com.shopping.inandout.util

@pattern("^[a-z0-9]+(?:-[a-z0-9]+)*$")
@length(min: 3, max: 63)
string Slug

@pattern("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$")
@length(min: 36, max: 36)
@documentation("Universally unique identifier for all scopes")
string UUID

@pattern("^[a-z0-9]+(?:-[a-z0-9]+)*$")
@length(min: 3, max: 63)
string Slug

list SlugList {
    member: Slug
}

@pattern("^[a-zA-Z0-9\\- ]+$")
@length(min: 3, max: 63)
string ResourceName

@pattern("^https?://[a-zA-Z0-9\\-._~:/?#\\[\\]@!$&'()*+,;=%]+\\.(jpg|jpeg|png|gif)$")
@length(min: 8, max: 255)
string ImageUrl

@pattern("^[a-zA-Z0-9\\-, ]+$")
@length(min: 8, max: 255)
string Description

@range(min: 0, max: 100)
double Percentage

@range(min: 0)
integer NaturalNumber

@range(min: 0)
double PositiveDouble

enum Currency {
    RON = "RON"
    EUR = "EUR"
    USD = "USD"
}

structure Price {
    @required
    amount: PositiveDouble

    @required
    @default("RON")
    currency: Currency
}
