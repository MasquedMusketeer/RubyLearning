list1 = ("a".."z").to_a
list2 = list1.map(&:upcase)
lists = [list1,list2]
lists.each do
  puts list1.size
end