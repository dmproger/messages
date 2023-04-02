# frozen_string_literal: true

require_relative '../lib/flexible_header'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe FlexibleHeader, 'default behavior' do
  subject { described_class.call(string) }

  let(:string) { 'abcdefghijklmnopqrstuvwxyz' }

  before { stub_const("#{described_class}::MESSAGE_LENGTH", length) }

  shared_context 'expected results' do
    it 'returns messages' do
      expect(subject).to eq(messages)
    end
  end

  context '0-9 message' do
    let(:length) { 15 }
    let(:messages) do
      [
        'Часть0 abcdefgh',
        'Часть1 ijklmnop',
        'Часть2 qrstuvwx',
        'Часть3 yz'
      ]
    end
    it_behaves_like 'expected results'
  end

  context 'over 10 messages' do
    let(:length) { 9 }
    let(:messages) do
      [
        'Часть0 ab',
        'Часть1 cd',
        'Часть2 ef',
        'Часть3 gh',
        'Часть4 ij',
        'Часть5 kl',
        'Часть6 mn',
        'Часть7 op',
        'Часть8 qr',
        'Часть9 st',
        'Часть10 u',
        'Часть11 v',
        'Часть12 w',
        'Часть13 x',
        'Часть14 y',
        'Часть15 z'
      ]
    end
    it_behaves_like 'expected results'
  end
end
