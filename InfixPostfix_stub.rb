#
# InfixPostfix class contains methods for infix to postfix conversion and
# postfix expression evaluation.
#
class InfixPostfix
  
  # converts the infix expression string to postfix expression and returns it
  def infixToPostfix(exprStr)

  end

  # evaluate the postfix string and returns the result
  def evaluatePostfix(exprStr)

  end

  private # subsequent methods are private methods

  # returns true if the input is an operator and false otherwise
  def operator?(str)
   
  end

  # returns true if the input is an operand and false otherwise
  def operand?(str)

  end

  # returns true if the input is a left parenthesis and false otherwise
  def leftParen?(str)

  end

  # returns true if the input is a right parenthesis and false otherwise
  def rightParen?(str)

  end

  # returns the stack precedence of the input operator
  def stackPrecedence(operator)

  end

  # returns the input precedence of the input operator
  def inputPrecedence(operator)

  end

  # applies the operators to num1 and num2 and returns the result
  def applyOperator(num1, num2, operator)

  end
  
end # end InfixPostfix class
