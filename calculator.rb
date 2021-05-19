class Calculator_v2
  attr_reader :oper

  def initialize
    @oper = {
      '+'  => 1,
      '-'  => 1,
      '*'  => 2,
      '/'  => 2,
      '%'  => 3,
      '**' => 3
    }
  end

  def infix_to_postfix(infix)
    stack = []

    postfix = []
    stack_value = 0
    infix_value = 0 # not necessary

    infix.split.each_with_index do |v, idx|
      postfix.push(v) if v =~ /[0-9]/
      stack.push(v) if v == '('

      if oper.include?(v)
        stack_value = oper.fetch(stack.last, stack_value)
        infix_value = oper[v]

        postfix.push(stack.pop) if stack_value >= infix_value

        stack.push v
      elsif v == ')'
        postfix.push(stack.pop) while stack.last != '('
        stack.pop
      end
    end

    (postfix + stack.reverse).join ' '
  end

  def eval_postfix(str_val)
    stack_int = []

    str_val.split.each do |chr|
      stack_int.push(chr.to_f) if chr =~ /[0-9]/

      if oper.include?(chr)
        x = stack_int.pop
        y = stack_int.pop

        stack_int.push(y.send(chr, x))
      end
    end

    stack_int.pop
  end

  def calculate(str_val)
    conv = infix_to_postfix(str_val)
    eval_postfix(conv)
  end
end
