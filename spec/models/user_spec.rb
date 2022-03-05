require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associatoins" do
    it { should have_many(:projects).through(:project_users) }
  end
end