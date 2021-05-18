require_relative '../calculator'

RSpec.describe Calculator_v2 do
  let(:cls) { described_class.new }

  it 'Infix to postfix converter' do
    str = '( 6 + 2 ) * 5 - 8 / 4'

    expect(cls.converter(str)).to eq '6 2 + 5 * 8 4 / -'
  end

  it 'Integer postfix evaluation' do
    cls.evaluator('5 2 + 5 * 8 4 / -')

    expect(cls.result).to eq 33
  end
  
  it 'Decimal postfix evaluation' do
    cls.evaluator('10.1 2 + 5 * 8 4 / -')

    expect(cls.result).to eq 58.5
  end

  it 'Exponent evaluation' do
    cls.global('5 ** 2')

    expect(cls.result).to eq 25
  end

  it 'Remainder evaluation ' do
    cls.global('5 % 3')

    expect(cls.result).to eq 2
  end
  
  it 'Global calculator evaluation' do
    cls.global('( ( 10 - 8 ) + 20 - ( 3.5 * 2 ) / 4 ** 2 ) % 4')

    expect(cls.result).to eq 1.5625
  end
end
