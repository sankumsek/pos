require 'spec_helper'

describe 'Cashier' do
  describe '.login' do
    it 'matches inputted spec with current spec inside of table' do
      new_cashier = Cashier.create(:login => 'Dr. Doom')
      expect(Cashier.login('Dr. Doom').first.login).to eq 'Dr. Doom'
    end
  end
end
