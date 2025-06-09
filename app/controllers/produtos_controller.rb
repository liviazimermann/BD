class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[ show edit update destroy ]

  # GET /produtos or /produtos.json
  def index
    @produtos = Produto.all
  end

  # GET /produtos/1 or /produtos/1.json
  def show
  end

  # GET /produtos/new
  def new
    @produto = Produto.new
  end

  # GET /produtos/1/edit
  def edit
  end

  # POST /produtos or /produtos.json
  def create
    @produto = Produto.new(produto_params)
    # SQL gerado:
    #   INSERT INTO produtos (nome, preco_unitario)
    #   VALUES (?, ?)
    respond_to do |format|
      if @produto.save
        format.html { redirect_to @produto, notice: "Produto foi criado com sucesso." }
        format.json { render :show, status: :created, location: @produto }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /produtos/1 or /produtos/1.json
  def update
    # SQL gerado:
    #   UPDATE produtos
    #   SET nome = ?, preco_unitario = ?
    #   WHERE id = ?
    respond_to do |format|
      if @produto.update(produto_params)
        format.html { redirect_to @produto, notice: "Produto foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @produto }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /produtos/1 or /produtos/1.json
  def destroy
    # SQL gerado:
    #   DELETE FROM produtos
    #   WHERE id = ?
    @produto.destroy!

    respond_to do |format|
      format.html { redirect_to produtos_path, status: :see_other, notice: "Produto foi excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre ações.
    def set_produto
      @produto = Produto.find(params.expect(:id))
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def produto_params
      params.expect(produto: [ :nome, :preco_unitario ])
    end
end
