require "application_system_test_case"

class VendaProdutosTest < ApplicationSystemTestCase
  setup do
    @venda_produto = venda_produtos(:one)
  end

  test "visiting the index" do
    visit venda_produtos_url
    assert_selector "h1", text: "Venda produtos"
  end

  test "should create venda produto" do
    visit venda_produtos_url
    click_on "New venda produto"

    fill_in "Id produto", with: @venda_produto.id_produto
    fill_in "Id venda", with: @venda_produto.id_venda
    fill_in "Preco unitario", with: @venda_produto.preco_unitario
    fill_in "Quantidade", with: @venda_produto.quantidade
    click_on "Create Venda produto"

    assert_text "Venda produto was successfully created"
    click_on "Back"
  end

  test "should update Venda produto" do
    visit venda_produto_url(@venda_produto)
    click_on "Edit this venda produto", match: :first

    fill_in "Id produto", with: @venda_produto.id_produto
    fill_in "Id venda", with: @venda_produto.id_venda
    fill_in "Preco unitario", with: @venda_produto.preco_unitario
    fill_in "Quantidade", with: @venda_produto.quantidade
    click_on "Update Venda produto"

    assert_text "Venda produto was successfully updated"
    click_on "Back"
  end

  test "should destroy Venda produto" do
    visit venda_produto_url(@venda_produto)
    click_on "Destroy this venda produto", match: :first

    assert_text "Venda produto was successfully destroyed"
  end
end
