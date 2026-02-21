# Overview

Our API is designed around Business Intent rather than database [tables](https://dbdiagram.io/d/InAndOut-693154e7d6676488ba8f6f4d). While the underlying schema is normalized, the API provides high-level abstractions to reduce "integration friction" for our users.

Our users are either:

- Clients (regular physical people)
- Owners (business/store/brand owner - have more privileges)
- Admins (system admins, devs, operational teams - have all privileges)

Main entities:

- Store: The physical unit with a brand identity, location, and operating schedule.
- Article: The brand-specific commercial definition of a product (Price, Currency, Brand).
- Stand: The bridge between an Article and a physical location (Edge) within a store.
- Offer: Promotional logic linked to articles or stores.

## API Interaction Patterns

### The Composite Pattern

To support a "one-click" onboarding experience for Owners, we provide Composite Operations.

Internal Automation: When a store registers a new Stand, the system automatically upserts the underlying Product and Article records if they do not already exist.

User Experience: Owners should not be forced to orchestrate three separate POST requests (Product -> Article -> Stand) to stock a shelf.

### The Granular Pattern

To satisfy complex intents - such as de-listing an item from a shelf without deleting it from the brand catalog; we expose Lower-Level APIs.

Persistence: Articles and Products exist independently of Stands. Removing a Stand entry does not destroy the Article record, allowing it to be easily re-placed or utilized by other stores of the same brand.

Advanced Intent: Allows power users to pre-register inventory at the brand level before physical distribution.

## Resource Encapsulation

We strictly enforce Domain Encapsulation to keep the API surface clean:

Brand & Program Management: Users should not interact with `/brands/` or `/operating/` directly. These are managed as sub-resources or nested attributes of a Store.

## Example Workflows

### Scenario A: Quick Onboarding (Composite)

Intent: "I want to put Alpro Almond Milk on Shelf A in Store #101."
Action: POST /stores/101/stands
Payload: Includes Product details (Vendor, Category), Price, and Location (edge_id).
Result: Backend creates/links Product, Article, and Stand in a single atomic transaction.

### Scenario B: Inventory Management (Granular)

Intent: "I want to remove this milk from the shelf but keep it in my brand catalog for later."
Action: DELETE /stores/101/stands/{id}
Result: The Stand record is removed. The Article and Product remain in the system for future use.

# Versioning

### User typical workflow

0. selects store
1. LIST **available** articles in the corresponding store (and then call `LIST offers` - not now, see v3)
2. uses the search bar
3. selects products (locally store, on client machine, the ids of the articles)
4. genereates itinerary (GET/POST the stand ids, solve the TSP)

The MVP implements an algorithm that solves TSP. In the beginning we will use mock data, basically we (the devs) will visit a market and make some measurements of it, populating the database.

The last operation is heavy and generates high costs. We could make a POST and return a job id instead. When the job is done, obviously the client will be able to inspect it further.

#### v0 (MVP - customer APIs):

1. LIST products of stores (paginated)
2. POST wanted articles

#### v1 (customer & store APIs):

0. GET nearby stores
1. CRUD for brand, store, floor, edge, node
2. CRUD for product, article, stand

#### v2 (store APIs):

0. CRUD operating, break, event

#### v3 (store APIs):

0. CRUD - offer, discount, dependency, period

### Future ideas

- store APIs should be available only to signed representatives of those; it means that some sort of authentication needs to be implemented starting with v1 => database schema update to cache client information and registrations.
- the idea above could be extended to cache for each client his generated itiniraries.
- actual store navigation could be possible.

### References

- https://smithy.io/2.0/quickstart.html
- https://github.com/Vldddddd1/InAndOut/issues/6
