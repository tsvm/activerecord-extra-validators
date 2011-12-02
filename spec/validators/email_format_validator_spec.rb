require 'spec_helper'

describe EmailFormatValidator do
  before(:all) do
    class UserWithEmail < ActiveRecord::Base
      set_table_name 'mocked_users'

      validates :email, email_format: true
    end
  end

  let(:user) { UserWithEmail.new }

  it 'does not accept invalid email format' do
    user.email = 'invalid'

    user.should_not be_valid
  end

  it 'accepts valid email format' do
    user.email = 'valid@email.com'

    user.should be_valid
  end
end
