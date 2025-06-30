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
    click_on "Novo estoque"

    fill_in "Data reposicao", with: @estoque.data_reposicao
    fill_in "Id produto", with: @estoque.id_produto
    fill_in "Quantidade disponivel", with: @estoque.quantidade_disponivel
    click_on "Criar Estoque"

    assert_text "Estoque criado com sucesso"
    click_on "Voltar"
  end

  test "should update Estoque" do
    visit estoque_url(@estoque)
    click_on "Editar este estoque", match: :first

    fill_in "Data reposicao", with: @estoque.data_reposicao
    fill_in "Id produto", with: @estoque.id_produto
    fill_in "Quantidade disponivel", with: @estoque.quantidade_disponivel
    click_on "Atualizar Estoque"

    assert_text "Estoque atualizado com sucesso"
    click_on "Voltar"
  end

  test "should destroy Estoque" do
    visit estoque_url(@estoque)
    click_on "Excluir este estoque", match: :first

    assert_text "Estoque excluído com sucesso"
  end
end
