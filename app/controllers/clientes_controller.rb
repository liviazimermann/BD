class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[ show edit update destroy ]

  # GET /clientes or /clientes.json
  def index
    @clientes = Cliente.all
  end

  # GET /clientes/1 or /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes or /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    # SQL gerado:
    #   INSERT INTO clientes (nome, email, telefone)
    #   VALUES (?, ?, ?)
    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: "Cliente foi criado com sucesso." }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1 or /clientes/1.json
  def update
    # SQL gerado:
    #   UPDATE clientes
    #   SET nome = ?, email = ?, telefone = ?
    #   WHERE id = ?
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: "Cliente foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1 or /clientes/1.json
  def destroy
    # SQL gerado:
    #   DELETE FROM clientes
    #   WHERE id = ?
    @cliente.destroy!

    respond_to do |format|
      format.html { redirect_to clientes_path, status: :see_other, notice: "Cliente foi excluído com sucesso." }
      format.json { head :no_content }
    end
  end

  private
    # Usa callbacks para compartilhar configurações ou restrições comuns entre ações.
    def set_cliente
      @cliente = Cliente.find(params.expect(:id))
    end

    # Permite apenas uma lista de parâmetros confiáveis.
    def cliente_params
      params.expect(cliente: [ :nome, :email, :telefone ])
    end
end
