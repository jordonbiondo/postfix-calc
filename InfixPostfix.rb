#
# InfixPostfix class contains methods for infix to postfix conversion and
# postfix expression evaluation.
#
class InfixPostfix

  attr_reader :operators

  def initialize

    @operators = {
      "+" => { :input_prec => 1, :stack_prec => 1, :action => Proc.new{|x,y| x+y}},
      "-" => { :input_prec => 1, :stack_prec => 1, :action => Proc.new{|x,y| x-y}},
      "*" => { :input_prec => 2, :stack_prec => 2, :action => Proc.new{|x,y| x*y}},
      "/" => { :input_prec => 2, :stack_prec => 2, :action => Proc.new{|x,y| (x/y).to_i}},
      "%" => { :input_prec => 2, :stack_prec => 2, :action => Proc.new{|x,y| x%y}},
      "^" => { :input_prec => 4, :stack_prec => 3, :action => Proc.new{|x,y| x**y}},
      "(" => { :input_prec => 5, :stack_prec => -1, :action => NIL}
    }
  end

  # converts the infix expression string to postfix expression and returns it
  def infixToPostfix(exprStr)
    expression = []
    stack = []
    move = Proc.new { expression.push stack.pop }
    exprStr.split(/\s+|\b/).each do |token|
      if operand? token then
        expression.push token

      elsif leftParen? token then
        stack.push token

      elsif operator? token then
        while operator? stack.last
          if @operators[stack.last][:stack_prec] >= @operators[token][:input_prec]
            expression.push stack.pop
          else
            break
          end
        end
        stack.push token

      elsif rightParen? token then
        while operator? stack.last
          if not leftParen? stack.last
            expression.push stack.pop
          else
            stack.pop
            break
          end
        end
      end

    end
    stack.reverse.each { |x| expression.push x}
    expression.join(" ")
  end

  # evaluate the postfix string and returns the result
  def evaluatePostfix(exprStr)
    stack = []
    exprStr.split(" ").each do |token|
      if operand? token then
        stack.push token
      elsif operator? token then
        y = stack.pop
        x = stack.pop
        stack.push applyOperator(x, y, token)
      end
    end
    stack.pop
  end

  private # subsequent methods are private methods

  # returns true if the input is an operator and false otherwise
  def operator?(str)
    @operators.has_key? str
  end

  # returns true if the input is an operand and false otherwise
  def operand?(str)
    str == str.to_i.to_s
  end

  # returns true if the input is a left parenthesis and false otherwise
  def leftParen?(str)
    str.eql? "("
  end

  # returns true if the input is a right parenthesis and false otherwise
  def rightParen?(str)
    str.eql? ")"
  end

  # returns the stack precedence of the input operator
  def stackPrecedence(operator)
    return @operaters[operator][:stack_prec]
  end

  # returns the input precedence of the input operator
  def inputPrecedence(operator)
    return @operaters[operator][:input_prec]
  end

  # applies the operators to num1 and num2 and returns the result
  def applyOperator(num1, num2, operator)
    @operators[operator][:action].call(num1.to_i, num2.to_i)
  end

end # end InfixPostfix class
