require 'rails_helper'

RSpec.describe "Episodes", type: :request do


  describe "POST /episodes" do
    it "public may not create episode"
  end

  describe "DESTROY /episodes/:id" do
    it "public may not delete episode"
  end

  describe "PUT /episodes/:id" do
    it "public may not edit episode"
  end

  describe "GET /episodes/" do
    it "public may not visit episodes page"
  end

  describe "GET /episodes/new" do
    it "public may not access new episode page"
  end

  describe "GET /episodes/:id/edit" do
    it "public may not access episode edit page"
  end

end
