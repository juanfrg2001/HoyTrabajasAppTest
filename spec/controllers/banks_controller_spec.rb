require 'rails_helper'

RSpec.describe BanksController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "assigns all banks as @banks" do
      bank = Bank.create(nombre: "Example Bank")
      get :index
      expect(assigns(:banks)).to eq([bank])
    end
  end

  describe "GET #show" do
    it "assigns the requested bank as @bank" do
      bank = Bank.create(nombre: "Example Bank")
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
          post :create, params: { bank: { nombre: "New Bank" } }
        }.to change(Bank, :count).by(1)
      end

      it "redirects to the created bank" do
        post :create, params: { bank: { nombre: "New Bank" } }
        expect(response).to redirect_to(Bank.last)
      end
    end

    context "with invalid params" do
      it "does not save the new bank" do
        expect {
          post :create, params: { bank: { nombre: nil } }
        }.to_not change(Bank, :count)
      end

      it "re-renders the 'new' template" do
        post :create, params: { bank: { nombre: nil } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested bank as @bank" do
      bank = Bank.create(nombre: "Example Bank")
      get :edit, params: { id: bank.id }
      expect(assigns(:bank)).to eq(bank)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) { { nombre: "Updated Name" } }

      it "updates the requested bank" do
        bank = Bank.create(nombre: "Example Bank")
        patch :update, params: { id: bank.id, bank: new_attributes }
        bank.reload
        expect(bank.nombre).to eq("Updated Name")
      end

      it "redirects to the bank" do
        bank = Bank.create(nombre: "Example Bank")
        patch :update, params: { id: bank.id, bank: new_attributes }
        expect(response).to redirect_to(bank)
      end
    end

    context "with invalid params" do
      it "does not update the bank" do
        bank = Bank.create(nombre: "Example Bank")
        patch :update, params: { id: bank.id, bank: { nombre: nil } }
        bank.reload
        expect(bank.nombre).to eq("Example Bank")
      end

      it "re-renders the 'edit' template" do
        bank = Bank.create(nombre: "Example Bank")
        patch :update, params: { id: bank.id, bank: { nombre: nil } }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bank" do
      bank = Bank.create(nombre: "Example Bank")
      expect {
        delete :destroy, params: { id: bank.id }
      }.to change(Bank, :count).by(-1)
    end

    it "redirects to the banks list" do
      bank = Bank.create(nombre: "Example Bank")
      delete :destroy, params: { id: bank.id }
      expect(response).to redirect_to(banks_url)
    end
  end
end
