require "application_system_test_case"

class EstoquesTest < ApplicationSystemTestCase
  setup do
    @estoque = estoques(:one)
  end

  test "visiting the index" do
    visit estoques_url
    assert_selector "h1", text: "Estoques"
  end

  test "should create estoque" do
    visit estoques_url
    click_on "New estoque"

    fill_in "Data reposicao", with: @estoque.data_reposicao
    fill_in "Id produto", with: @estoque.id_produto
    fill_in "Quantidade disponivel", with: @estoque.quantidade_disponivel
    click_on "Create Estoque"

    assert_text "Estoque was successfully created"
    click_on "Back"
  end

  test "should update Estoque" do
    visit estoque_url(@estoque)
    click_on "Edit this estoque", match: :first

    fill_in "Data reposicao", with: @estoque.data_reposicao
    fill_in "Id produto", with: @estoque.id_produto
    fill_in "Quantidade disponivel", with: @estoque.quantidade_disponivel
    click_on "Update Estoque"

    assert_text "Estoque was successfully updated"
    click_on "Back"
  end

  test "should destroy Estoque" do
    visit estoque_url(@estoque)
    click_on "Destroy this estoque", match: :first

    assert_text "Estoque was successfully destroyed"
  end
end
