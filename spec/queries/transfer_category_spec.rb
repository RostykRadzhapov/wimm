# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoryIdQuery do
  let!(:user) { create(:user) }
  let!(:income_transfer_category) do
    create(
      :category,
      :income_transfer_category,
      user_id: user.id
    )
  end

  let!(:withdraw_transfer_category) do
    create(
      :category,
      :withdraw_transfer_category,
      user_id: user.id
    )
  end

  subject(:query) { described_class.new(user) }

  describe 'got expected id for type category' do
    it 'returns expected id' do
      expect(query.withdraw).to eq(withdraw_transfer_category.id)
    end

    it 'returns expected id' do
      expect(query.income).to eq(income_transfer_category.id)
    end
  end
end
