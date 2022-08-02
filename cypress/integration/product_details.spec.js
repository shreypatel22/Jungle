describe("Testing Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should click on a product", () => {
    cy.contains("Scented Blade").click()
    cy.contains("The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.")
  })
  
});