require 'rails_helper'

RSpec.describe PlaylistSong, type: :model do
  describe 'relationships' do
    it {should belong_to :song}
    it {should belong_to :playlist}
  end
end
