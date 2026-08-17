const{test,expect} = require('@playwright/test');
test('user can view product details' ,async({page})=>{
await page.goto('/');
await page.locator('[data-test="search-query"]').fill('Hammer');
await page.locator('[data-test="search-submit"]').click();

await expect(page.locator('[data-test="search-caption"]')).toContainText('Hammer');

const hammer = page.locator('.card').filter({has:page.getByText('Hammer', {exact:true})})
await hammer.click();

await expect(page.locator('[data-test="product-name"]')).toHaveText('Hammer');
await expect(page.locator('[data-test="unit-price"]')).toBeVisible();
await expect(page.locator('[data-test="add-to-cart"]')).toBeVisible();

});