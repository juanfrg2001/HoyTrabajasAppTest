require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns all banks as @banks" do
      bank = Bank.create(name: "Example Bank")
      get :index
      expect(assigns(:banks)).to eq([bank])
    end
  end

  describe "GET #show" do
    it "assigns the requested bank as @bank" do
      bank = Bank.create(name: "Example Bank")
      get :show, params: { id: bank.id }
      expect(assigns(:bank)).to eq(bank)
    end
  end

  describe "GET #new" do
    it "assigns a new bank as @bank" do
      get :new
      expect(assigns(:bank)).to be_a_new(Bank)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new bank" do
        expect {
          post :create, params: { bank: { name: "New Bank" } }
        }.to change(Bank, :count).by(1)
      end

      it "redirects to the created bank" do
        post :create, params: { bank: { name: "New Bank" } }
        expect(response).to redirect_to(Bank.last)
      end
    end

    context "with invalid params" do
      it "does not save the new bank" do
        expect {
          post :create, params: { bank: { name: nil } }
        }.to_not change(Bank, :count)
      end

      it "re-renders the 'new' template" do
        post :create, params: { bank: { name: nil } }
        expect(response).to render_template("new")
      end
    end
  end

  # Resto de las pruebas como se ha mostrado anteriormente
end

