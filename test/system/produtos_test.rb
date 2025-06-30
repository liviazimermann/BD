require "application_system_test_case"

class ProdutosTest < ApplicationSystemTestCase
  setup do
    @produto = produtos(:one)
  end

  test "visiting the index" do
    visit produtos_url
    assert_selector "h1", text: "Produtos"
  end

  test "should create produto" do
    visit produtos_url
    click_on "Novo produto"
    fill_in "Nome", with: @produto.nome
    fill_in "Preco unitario", with: @produto.preco_unitario
    click_on "Criar Produto"
    assert_text "Produto criado com sucesso"
    click_on "Voltar"
  end

  test "should update Produto" do
    visit produto_url(@produto)
    click_on "Editar este produto", match: :first
    fill_in "Nome", with: @produto.nome
    fill_in "Preco unitario", with: @produto.preco_unitario
    click_on "Atualizar Produto"
    assert_text "Produto atualizado com sucesso"
    click_on "Voltar"
  end

  test "should destroy Produto" do
    visit produto_url(@produto)
    click_on "Excluir este produto", match: :first
    assert_text "Produto excluído com sucesso"
  end
end
