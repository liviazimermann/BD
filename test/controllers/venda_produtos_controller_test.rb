require "test_helper"

class VendaProdutosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @venda_produto = venda_produtos(:one)
  end

  test "should get index" do
    get venda_produtos_url
    assert_response :success
  end

  test "should get new" do
    get new_venda_produto_url
    assert_response :success
  end

  test "should create venda_produto" do
    assert_difference("VendaProduto.count") do
      post venda_produtos_url, params: { venda_produto: { id_produto: @venda_produto.id_produto, id_venda: @venda_produto.id_venda, preco_unitario: @venda_produto.preco_unitario, quantidade: @venda_produto.quantidade } }
    end

    assert_redirected_to venda_produto_url(VendaProduto.last)
  end

  test "should show venda_produto" do
    get venda_produto_url(@venda_produto)
    assert_response :success
  end

  test "should get edit" do
    get edit_venda_produto_url(@venda_produto)
    assert_response :success
  end

  test "should update venda_produto" do
    patch venda_produto_url(@venda_produto), params: { venda_produto: { id_produto: @venda_produto.id_produto, id_venda: @venda_produto.id_venda, preco_unitario: @venda_produto.preco_unitario, quantidade: @venda_produto.quantidade } }
    assert_redirected_to venda_produto_url(@venda_produto)
  end

  test "should destroy venda_produto" do
    assert_difference("VendaProduto.count", -1) do
      delete venda_produto_url(@venda_produto)
    end

    assert_redirected_to venda_produtos_url
  end
end
