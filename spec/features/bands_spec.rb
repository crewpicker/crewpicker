require 'spec_helper'

describe "Bands" do
  before(:each) do
    create(:user_with_admin_role)
    visit root_path

    fill_in "username", with: "test"
    fill_in "password", with: "haxx44"
    click_on "Logg inn"
  end

  describe "index action" do
    before(:each) do
      create(:band, name: "Blast from the Past")
      visit bands_path
    end

    it "includes created band" do
      page.should have_content("Blast from the Past")
    end
  end

  describe "show action" do
    before(:each) do
      band = create(:band, name: "Hello World", description: "Lorem ipsum")
      visit band_path(band)
    end

    it "includes content" do
      page.should have_content("Lorem ipsum")
    end
  end

  describe "create action" do
    before(:each) do
      visit root_path
      click_on "Legg inn bandpåmelding"
    end

    it "requires name" do
      click_on "Lagre"
      page.should have_content("Name kan ikke være blank")
    end

    describe "with valid band" do
      before(:each) do
        fill_in "band_name", with: "Blast from the Past"
        fill_in "band_description", with: "Hello world"
        click_on "Lagre"
      end

      it "says the record was created" do
        page.should have_content("Bandet er registrert")
      end

      it "redirects to show page" do
        current_path.should eq(band_path(Band.last))
      end

      it "has updated title" do
        page.should have_content("Blast from the Past")
      end
    end
  end

  describe "update action" do
    before(:each) do
      band = create(:band, name: "Blast from the Past")
      visit band_path(band)
      click_on "Endre"
    end

    it "displays validation errors" do
      fill_in "band_name", with: ""
      click_on "Lagre"
      page.should have_content("error prohibited this")
    end

    describe "with valid episode" do
      before(:each) do
        fill_in "band_name", with: "Back to the Future"
        click_on "Lagre"
      end

      it "redirects to show page" do
        current_path.should eq(band_path(Band.last))
      end

      it "says the record was updated" do
        page.should have_content("Bandopplysningene er oppdatert")
      end

      it "has updated title" do
        page.should have_content("Back to the Future")
      end
    end
  end
end
