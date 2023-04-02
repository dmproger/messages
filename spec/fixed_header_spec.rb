# frozen_string_literal: true

require_relative '../lib/fixed_header'

RSpec.configure do |config|
  config.default_formatter = 'doc'
end

RSpec.describe FixedHeader, 'default behavior' do
  subject { described_class.call(string) }

  let(:string) { 'abcdefghijklmnopqrstuywxyz' }

  before { stub_const("#{described_class}::MESSAGE_LENGTH", length) }

  shared_context 'expected results' do
    it 'returns messages' do
      expect(subject).to eq(messages)
    end
  end

  context '0-9 message' do
    let(:length) { 16 }
    let(:messages) do
      [
        'Часть00 abcdefgh',
        'Часть01 ijklmnop',
        'Часть02 qrstuywx',
        'Часть03 yz'
      ]
    end
    it_behaves_like 'expected results'
  end

  context 'over 10 messages' do
    let(:length) { 10 }
    let(:messages) do
      [
        'Часть00 ab',
        'Часть01 cd',
        'Часть02 ef',
        'Часть03 gh',
        'Часть04 ij',
        'Часть05 kl',
        'Часть06 mn',
        'Часть07 op',
        'Часть08 qr',
        'Часть09 st',
        'Часть10 uy',
        'Часть11 wx',
        'Часть12 yz'
      ]
    end
    it_behaves_like 'expected results'
  end
end
