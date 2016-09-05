defmodule Stack.Server do
  use GenServer

  @default_stack [1,2,3]

  ##External API

  def start_link(stack \\ @default_stack) do
  	GenServer.start_link(__MODULE__, stack, name: __MODULE__)
  end

  def pop do
  	GenServer.call __MODULE__, :pop
  end

  def push(item) do
  	GenServer.call __MODULE__, { :push, item }
  end

  def stack do
  	GenServer.call __MODULE__, :actual
  end

  ## GenServer Impl

  def handle_call(:pop, _from, []) do
  	{:reply, "empty stack", []}
  end

  def handle_call(:pop, _from, [_head|tail]) do
  	{:reply, tail, tail}
  end

  def handle_call( {:push, item} , _from, stack) do
  	{:reply, [item] ++ stack, [item] ++ stack}
  end

def handle_call(:actual , _from, stack) do
  	{:reply, stack, stack}
  end
end