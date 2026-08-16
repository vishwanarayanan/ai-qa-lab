const {test,expect}= require('@playwright/test');
test('Toolshop homepage loads successfully', async({page})=>{
    await page.goto('/');
    await expect(page).toHaveTitle(/Practice Software Testing/);
});