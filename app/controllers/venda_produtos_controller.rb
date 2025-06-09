class VendaProdutosController < ApplicationController
  before_action :set_venda_produto, only: %i[ show edit update destroy ]

  # GET /venda_produtos or /venda_produtos.json
  def index
    @venda_produtos = VendaProduto.all
  end

  # GET /venda_produtos/1 or /venda_produtos/1.json
  def show
  end

  # GET /venda_produtos/new
  def new
    @venda_produto = VendaProduto.new
  end

  # GET /venda_produtos/1/edit
  def edit
  end

  # POST /venda_produtos or /venda_produtos.json
  def create
    @venda_produto = VendaProduto.new(venda_produto_params)
    # SQL gerado:
    #   INSERT INTO venda_produtos (id_venda, id_produto, quantidade, preco_unitario)
    #   VALUES (?, ?, ?, ?)
    respond_to do |format|
      if @venda_produto.save
        format.html { redirect_to @venda_produto, notice: "Produto da venda foi criado com sucesso." }
        format.json { render :show, status: :created, location: @venda_produto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venda_produtos/1 or /venda_produtos/1.json
  def update
    # SQL gerado:
    #   UPDATE venda_produtos
    #   SET id_venda = ?, id_produto = ?, quantidade = ?, preco_unitario = ?
    #   WHERE id = ?
    respond_to do |format|
      if @venda_produto.update(venda_produto_params)
        format.html { redirect_to @venda_produto, notice: "Produto da venda foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @venda_produto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venda_produtos/1 or /venda_produtos/1.json
  def destroy
    # SQL gerado:
    #   DELETE FROM venda_produtos
    #   WHERE id = ?
    @venda_produto.destroy!

    respond_to do |format|
      format.html { redirect_to venda_produtos_path, status: :see_other, notice: "Produto da venda foi excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre ações.
    def set_venda_produto
      @venda_produto = VendaProduto.find(params.expect(:id))
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def venda_produto_params
      params.expect(venda_produto: [ :id_venda, :id_produto, :quantidade, :preco_unitario ])
    end
end
