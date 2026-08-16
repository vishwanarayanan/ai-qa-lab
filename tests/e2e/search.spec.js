const {test,expect} = require('@playwright/test');
test('user can search for a product',async({page})=>{
  await page.goto('/');
  await page.locator('[data-test="search-query"]').fill('Hammer');
  await page.locator('[data-test="search-submit"]').click();
  await expect(page.getByText('Hammer',{exact:true})).toBeVisible();



});