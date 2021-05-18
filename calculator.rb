class Calculator_v2
  attr_reader :oper, :result

  def initialize
    @oper = { '+' => 1, '-' => 1, '*' => 2, '/' => 2, '%' => 3, '**' => 3 }
    @result = 0
  end

  def converter(str_val)
    stack = ['(']
    infix = "#{str_val} )"
    postfix = ''
    stack_value = 0
    infix_value = 0

    infix_array = infix.split

    while stack.empty? != true
      infix_array.each do |v|
        postfix += " #{v}" if v =~ /[0-9]/
        stack.push(v) if v == '('
        if @oper.include?(v)
          @oper.each do |key, val|
            stack_value = val if key == stack.last
            infix_value = val if key == v
          end
          postfix += " #{stack.pop}" if stack_value >= infix_value
          stack.push(v)
        elsif v == ')'
          postfix += " #{stack.pop}" while stack.last != '('
          stack.pop
        end
      end
    end
    postfix[1..-1]
  end

  def evaluator(str_val)
    stack_int = []
    str_op = str_val.split
    str_op.push(')')
    str_op.each do |chr|
      if chr != ')'
        stack_int.push(chr.to_f) if chr =~ /[0-9]/
        if @oper.include?(chr)
          x = stack_int.pop
          y = stack_int.pop
          stack_int.push(y.method(chr).(x))
        end
      else
        @result = stack_int.pop
      end
    end
  end

  def global(str_val)
    conv = converter(str_val)
    evaluator(conv)
  end
end
