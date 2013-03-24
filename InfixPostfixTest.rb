require "test/unit"
require "./InfixPostfix.rb"

#
# Unit test cases for infixToPostfix() and evaluatePostfix() methods of InfixPostfix class
# 
class InfixPostfixTest < Test::Unit::TestCase
 
  def setup
    @ipObj = InfixPostfix.new()
  end
  
  def test_infixToPostfix_1
    assert_equal("3 4 2 5 ^ - * 6 +", @ipObj.infixToPostfix("3 * ( 4 - 2 ^ 5 ) + 6"))
  end
 
  def test_infixToPostfix_2
    assert_equal("3 2 1 2 + ^ ^", @ipObj.infixToPostfix("3 ^ 2 ^ ( 1 + 2 )"))
  end
  
  def test_infixToPostfix_3
    assert_equal("10 2 2 2 ^ ^ * 10 50 * +", @ipObj.infixToPostfix("10 * ( 2 ^ 2 ^ 2 ) + 10 * 50"))
  end
  
  def test_infixToPostfix_4
    assert_equal("100 50 2 3 ^ - / 50 10 / - 5 +", @ipObj.infixToPostfix("100 / ( 50 - 2 ^ 3 ) - 50 / 10 + 5"))
  end
  
  def test_infixToPostfix_5
    assert_equal("10 54 10 % 25 10 - 2 2 ^ + * 3 / +", @ipObj.infixToPostfix("10 + 54 % 10 * ( 25 - 10 + 2 ^ 2 ) / 3"))
  end
  
  def test_infixToPostfix_6
    assert_equal("10 5 2 % + 5 3 3 ^ * + 25 5 / -", @ipObj.infixToPostfix("( 10 + 5 % 2 ) + ( 5 * 3 ^ 3 ) - ( 25 / 5 )"))
  end
  
  def test_evaluatePostfix_1
    assert_equal(-78, @ipObj.evaluatePostfix("3 4 2 5 ^ - * 6 +"))
  end
  
  def test_evaluatePostfix_2
    assert_equal(6561, @ipObj.evaluatePostfix("3 2 1 2 + ^ ^"))
  end
  
  def test_evaluatePostfix_3
    assert_equal(660, @ipObj.evaluatePostfix("10 2 2 2 ^ ^ * 10 50 * +"))
  end
  
  def test_evaluatePostfix_4
    assert_equal(2, @ipObj.evaluatePostfix("100 50 2 3 ^ - / 50 10 / - 5 +"))
  end
  
  def test_evaluatePostfix_5
    assert_equal(35, @ipObj.evaluatePostfix("10 54 10 % 25 10 - 2 2 ^ + * 3 / +"))
  end
  
  def test_evaluatePostfix_6
    assert_equal(141, @ipObj.evaluatePostfix("10 5 2 % + 5 3 3 ^ * + 25 5 / -"))
  end
end
