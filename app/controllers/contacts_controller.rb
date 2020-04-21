class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contact = Contact.new
  end

  def show
    @contact = Contact.new
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @contact = Contact.new
    @animaldata = Animal.all

  end

  def create
    @animal = Animal.find(params[:animal_id])
    @contact = @animal.contacts.new(contact_params)

    if @contact.save
      @animal.update(buyer_id: current_user.id)
      ContactMailer.contact_mail(@contact).deliver
      redirect_to animal_contacts_path,notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(contact_params)
      @animal = Animal.find(params[:animal_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
