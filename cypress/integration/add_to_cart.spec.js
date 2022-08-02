describe("Testing Add to Cart", () => {

  it("should navigate to home", () => {
    cy.visit("/");
  })

  it("should click on add to cart button for non sold out item", () => {
    cy.contains("Scented Blade").parent('article').find(".btn").click({ force: true })

  })

  it("should have 1 item in cart", () => {
    cy.contains("My Cart (1)").should("exist")
  })
  
});