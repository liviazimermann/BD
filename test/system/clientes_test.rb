require "application_system_test_case"

class ClientesTest < ApplicationSystemTestCase
  setup do
    @cliente = clientes(:one)
  end

  test "visiting the index" do
    visit clientes_url
    assert_selector "h1", text: "Clientes"
  end

  test "should create cliente" do
    visit clientes_url
    click_on "Novo cliente"

    fill_in "Email", with: @cliente.email
    fill_in "Nome", with: @cliente.nome
    fill_in "Telefone", with: @cliente.telefone
    click_on "Criar Cliente"

    assert_text "Cliente criado com sucesso"
    click_on "Voltar"
  end

  test "should update Cliente" do
    visit cliente_url(@cliente)
    click_on "Editar este cliente", match: :first

    fill_in "Email", with: @cliente.email
    fill_in "Nome", with: @cliente.nome
    fill_in "Telefone", with: @cliente.telefone
    click_on "Atualizar Cliente"

    assert_text "Cliente atualizado com sucesso"
    click_on "Voltar"
  end

  test "should destroy Cliente" do
    visit cliente_url(@cliente)
    click_on "Excluir este cliente", match: :first

    assert_text "Cliente excluído com sucesso"
  end
end
