defmodule EditDistance do

  def edit_distance(string1, string2) do
    s1 = String.codepoints string1
    s2 = String.codepoints string2

    IO.inspect EditDistance.edit(s1, s2)
  end

  def edit(s1, s2) when length(s1) == 0 do
    length(s2)
  end

  def edit(s1, s2) when length(s2) == 0 do
    length(s1)
  end

  def edit(s1, s2) do
    [head1|tail1] = s1
    [head2|tail2] = s2
    # Insertion insert "head1" to s2
    insert = EditDistance.edit(tail1, s2) + 1
    # Deletetion delete head2 from s2
    delete = EditDistance.edit(s1, tail2) + 1
    # Substitute head2 to head1
    edit = if head1 == head2 do
             # If head1 == head2 edit cost is free
             # (you don't need to edit, just skip to next recursion)
             EditDistance.edit(tail1, tail2)
           else
             EditDistance.edit(tail1, tail2) + 1
           end
    costs = [insert, delete, edit]
    Enum.min(costs)
  end
end

EditDistance.edit_distance("algorithm", "altruistic")
EditDistance.edit_distance("saturday", "sunday")
