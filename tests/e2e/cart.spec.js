const { test, expect } = require('@playwright/test');

test('user can view product in cart', async ({ page }) => {
  await page.goto('/');

  await page.locator('[data-test="search-query"]').fill('Hammer');
  await page.locator('[data-test="search-submit"]').click();

  await expect(page.locator('[data-test="search-caption"]'))
    .toContainText('Hammer');

  const hammer = page.locator('.card').filter({
    has: page.getByText('Hammer', { exact: true })
  });

  await hammer.click();

  await page.locator('[data-test="add-to-cart"]').click();

  await page.locator('[data-test="nav-cart"]').click();

  await expect(page.locator('[data-test="product-name"]'))
    .toHaveText('Hammer');

  await expect(page.locator('[data-test="quantity"]'))
    .toHaveValue('1');

  await expect(page.locator('[data-test="unit-price"]'))
    .toBeVisible();
});