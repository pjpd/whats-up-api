require 'rails_helper'

RSpec.describe Collection, type: :model do
    # Association test
    # ensure Colleciton model has a 1:m relationship with the Webpage model
    it { should have_many(:webpages).dependent(:destroy) }

    # Validation Tests
    # ensure column title is present before saving
    it { should validate_presence_of(:title) }

end
