require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "associatoins" do
    it { should have_many(:users).through(:project_users) }
    it { should have_many(:logs) }
  end
end