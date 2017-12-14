class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :destroy, :update]
  # GET /contacs
  def index
    @contacts = Contact.all
  end

  # GET /contacts/:id
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @contact.build_address
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contato Criado com Sucesso!'
    else
      render :new
    end
  end

  # /contacts/:id/edit
  def edit
  end

  # PATCH/PUT /contacts/:id
  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contato Atualizado com Sucesso!'
    else
      render :edit
    end
  end

  # DELETE /contacts/:id
  def destroy
    @usuario.destroy
    redirect_to contacts_url, notice: 'Contato excluido com sucesso!'
  end

  private
    # setar no callback before_action
    def set_contact
      @contact = Contact.find(params[:id])
    end

    #White params // parametros permitidos para a persistencia
    def contact_params
      params.require(:contact)
            .permit(:name, :email, :phone, :description,
                      address_attributes: [:street, :number, :city, :state]
                    )
    end
end
