defmodule StackTest do
  use ExUnit.Case
  doctest Stack

  test "testing push one item" do
  	Stack.Server.start_link [1,2,3]
  	stack = Stack.Server.push 4
  	assert stack = [4,1,2,3]
  end

  test "testing pop one item" do
  	Stack.Server.start_link [1,2,3]
  	stack = Stack.Server.pop
  	assert stack = [2,3]
  end

  test "testing init empty array" do
  	Stack.Server.start_link []
  	stack = Stack.Server.stack
  	assert stack = []
  end

  test "test pop all elements" do
  	Stack.Server.start_link [1,2]
  	Stack.Server.pop
  	Stack.Server.pop
  	assert stack = []
  end

  test "testing pop empty list" do
  	Stack.Server.start_link [1,2]
  	Stack.Server.pop
  	Stack.Server.pop
  	return = Stack.Server.pop
  	assert return = "empty stack"
  end

end
