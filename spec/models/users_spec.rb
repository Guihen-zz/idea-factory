describe User do

  describe 'When signing up' do

    it 'should create an user when its informations are valid' do
      john = create(:user)
      expect(john.id).to be_a_kind_of Integer
    end

    context 'with an invalid information should not create an user' do
      it 'with no username' do
        anonymous = build(:user, :anonymous)
        expect(anonymous).not_to be_valid
      end

      it 'with no password' do
        john = build(:user, :no_passwd)
        expect(john).not_to be_valid
      end

      context 'when the email is invalid' do
        it 'with no email' do
          john = build(:user, :unreachable)
          expect(john).not_to be_valid
        end

        it 'with an invalid email' do
          john = build(:user, :invalid_email)
          expect(john).not_to be_valid
        end

        it 'with an existing email' do
          john = create(:user, email: 'j@mail.com')
          jane = build(:user, email: 'j@mail.com')

          expect(jane).not_to be_valid
        end
      end #context

    end

  end
end