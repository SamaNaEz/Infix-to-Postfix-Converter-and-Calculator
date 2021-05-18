require_relative '../calculator'

RSpec.describe Calculator_v2 do
  let(:cls) { described_class.new }

  it 'Infix to postfix converter' do
    str = '( 6 + 2 ) * 5 - 8 / 4'

    expect(cls.infix_to_postfix(str)).to eq '6 2 + 5 * 8 4 / -'
  end

  it 'Integer postfix evaluation' do
    expect(cls.eval_postfix('5 2 + 5 * 8 4 / -')).to eq 33
  end

  it 'Decimal postfix evaluation' do
    expect(cls.eval_postfix('10.1 2 + 5 * 8 4 / -')).to eq 58.5
  end

  it 'Exponent evaluation' do
    expect(cls.calculate('5 ** 2')).to eq 25
  end

  it 'Remainder evaluation ' do
    expect(cls.calculate('5 % 3')).to eq 2
  end

  it 'Global calculator evaluation' do
    expect(cls.calculate('( ( 10 - 8 ) + 20 - ( 3.5 * 2 ) / 4 ** 2 ) % 4')).to eq 1.5625
  end
end
