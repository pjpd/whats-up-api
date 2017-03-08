require 'rails_helper'

RSpec.describe Webpage, type: :model do
  # Association test
  # ensure an webpage record belongs to a single collection
  it { should belong_to(:collection) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:text) }


end
