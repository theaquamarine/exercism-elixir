defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
    case l do
      [_ | t] -> 1 + count(t)
      [] -> 0
    end
  end

  @spec reverse(list) :: list
  def reverse(l) do
    doreverse(l, [])
  end

  def doreverse([h|t], r) do doreverse(t, [h | r]) end
  def doreverse([], r) do r end

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    case l do
        [h | t] -> [f.(h) | map(t, f)]
        [] -> []
    end
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    case l do
        [] -> []
        [h | t] -> case f.(h) do
                    true -> [h | filter(t, f)]
                    false -> filter(t, f)
                end
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    case l do
        [] -> acc
        [h|t] -> reduce(t, f.(h, acc), f)
    end
  end

  @spec append(list, list) :: list
  def append(a, b) do
    doappend(reverse(a), b)
  end

  # Can only prepend to lists
  def doappend([h|t], b) do doappend(t, [h|b]) end
  def doappend([], b) do b end

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(ll) |> reduce([], fn(x, y) -> append(x,y) end)
  end
end
