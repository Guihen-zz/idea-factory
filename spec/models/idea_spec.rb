describe Idea do

  describe 'Saving Ideas' do

    context 'Creating a valid idea' do
      it 'should save the idea' do
        food_sharing = create(:idea)
        expect(food_sharing.id).to be_a_kind_of Integer
      end
    end

    context 'Creating an invalid idea' do
      it 'should not save an idea without a name' do
        unnamed = build(:idea, :unnamed)
        expect(unnamed).not_to be_valid
      end
    end
  end
end