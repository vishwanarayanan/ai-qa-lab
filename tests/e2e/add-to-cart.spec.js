const{test,expect} = require('@playwright/test');
test('user can add product to cart' ,async({page})=>{
await page.goto('/');
await page.locator('[data-test="search-query"]').fill('Hammer');
await page.locator('[data-test="search-submit"]').click();

await expect(page.locator('[data-test="search-caption"]')).toContainText('Hammer');

const hammer = page.locator('.card').filter({has:page.getByText('Hammer', {exact:true})})
await hammer.click();

await expect(page.locator('[data-test="product-name"]')).toHaveText('Hammer');
await expect(page.locator('[data-test="unit-price"]')).toBeVisible();
await expect(page.locator('[data-test="add-to-cart"]')).toBeVisible();
await page.locator('[data-test="add-to-cart"]').click();
const toastMessage = page.getByRole('alert');
await expect(toastMessage).toBeVisible();
await expect(toastMessage).toContainText('Product added to shopping cart');
await expect(page.locator('[data-test="nav-cart"]')).toContainText('1');


});