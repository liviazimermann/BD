class EstoquesController < ApplicationController
  before_action :set_estoque, only: %i[ show edit update destroy ]

  # GET /estoques or /estoques.json
  def index
    @estoques = Estoque.all
  end

  # GET /estoques/1 or /estoques/1.json
  def show
  end

  # GET /estoques/new
  def new
    @estoque = Estoque.new
  end

  # GET /estoques/1/edit
  def edit
  end

  # POST /estoques or /estoques.json
  def create
    @estoque = Estoque.new(estoque_params)
    # SQL gerado:
    #   INSERT INTO estoques (id_produto, quantidade_disponivel, data_reposicao)
    #   VALUES (?, ?, ?)
    respond_to do |format|
      if @estoque.save
        format.html { redirect_to @estoque, notice: "Estoque foi criado com sucesso." }
        format.json { render :show, status: :created, location: @estoque }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estoques/1 or /estoques/1.json
  def update
    # SQL gerado:
    #   UPDATE estoques
    #   SET id_produto = ?, quantidade_disponivel = ?, data_reposicao = ?
    #   WHERE id = ?
    respond_to do |format|
      if @estoque.update(estoque_params)
        format.html { redirect_to @estoque, notice: "Estoque foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @estoque }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @estoque.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estoques/1 or /estoques/1.json
  def destroy
    # SQL gerado:
    #   DELETE FROM estoques
    #   WHERE id = ?
    @estoque.destroy!

    respond_to do |format|
      format.html { redirect_to estoques_path, status: :see_other, notice: "Estoque foi excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre ações.
    def set_estoque
      @estoque = Estoque.find(params.expect(:id))
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def estoque_params
      params.expect(estoque: [ :id_produto, :quantidade_disponivel, :data_reposicao ])
    end
end
