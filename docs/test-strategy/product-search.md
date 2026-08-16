# Product Search E2E Test

## Objective

Verify that a user can search for a product and see the expected
product in the search results.

## Test Scenario

1. Open the Toolshop homepage.
2. Enter `Hammer` in the search field.
3. Submit the search.
4. Verify that the exact `Hammer` product is displayed.

## Implementation

**Test:** `tests/e2e/search.spec.js`

**Browsers:** Chromium, Firefox, WebKit

## Locator Strategy

| Element | Locator | Reason |
|---|---|---|
| Search field | `[data-test="search-query"]` | Stable test attribute |
| Search button | `[data-test="search-submit"]` | Stable test attribute |
| Product result | `getByText('Hammer', { exact: true })` | Targets the exact product |

## Assertion

The test verifies that the exact `Hammer` product is visible
after the search is submitted.

We avoid using `.nth()` because the position of a product in the
search results is not part of the expected behavior.

## Result

The test passes across all configured browsers.

## Key Learning

- Codegen output should be reviewed before being used.
- Stable locators make tests easier to maintain.
- Assertions should verify the expected user behavior.
- Avoid relying on element position when position is not part of
  the requirement.