class VendasController < ApplicationController
  before_action :set_venda, only: %i[ show edit update destroy ]

  # GET /vendas or /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1 or /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas or /vendas.json
  def create
    @venda = Venda.new(venda_params)
    # SQL gerado:
    #   INSERT INTO vendas (id_cliente, data_venda, valor_total)
    #   VALUES (?, ?, ?)
    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: "Venda foi criada com sucesso." }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1 or /vendas/1.json
  def update
    # SQL gerado:
    #   UPDATE vendas
    #   SET id_cliente = ?, data_venda = ?, valor_total = ?
    #   WHERE id = ?
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: "Venda foi atualizada com sucesso." }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1 or /vendas/1.json
  def destroy
    # SQL gerado:
    #   DELETE FROM vendas
    #   WHERE id = ?
    @venda.destroy!

    respond_to do |format|
      format.html { redirect_to vendas_path, status: :see_other, notice: "Venda foi excluída com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre ações.
    def set_venda
      @venda = Venda.find(params.expect(:id))
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def venda_params
      params.expect(venda: [ :id_cliente, :data_venda, :valor_total ])
    end
end
