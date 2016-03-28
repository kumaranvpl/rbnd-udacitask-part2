require 'chronic'
require 'colorize'
require 'terminal-table'# Find a third gem of your choice and add it to your project
require 'date'
require_relative "lib/listable"
require_relative "lib/typeable"
require_relative "lib/errors"
require_relative "lib/udacilist"
require_relative "lib/todo"
require_relative "lib/event"
require_relative "lib/link"

list = UdaciList.new(title: "Julia's Stuff")
list.add("todo", "Buy more cat food", due: "2016-02-03", priority: "low")
list.add("todo", "Sweep floors", due: "2016-01-30")
list.add("todo", "Buy groceries", priority: "high")
list.add("event", "Birthday Party", start_date: "2016-05-08")
list.add("event", "Vacation", start_date: "2016-05-28", end_date: "2016-05-31")
list.add("link", "https://github.com", site_name: "GitHub Homepage")
list.all
list.delete(3)
list.all

# SHOULD CREATE AN UNTITLED LIST AND ADD ITEMS TO IT
# --------------------------------------------------
new_list = UdaciList.new # Should create a list called "Untitled List"
new_list.add("todo", "Buy more dog food", due: "in 5 weeks", priority: "medium")
new_list.add("todo", "Go dancing", due: "in 2 hours")
new_list.add("todo", "Buy groceries", priority: "high")
new_list.add("event", "Birthday Party", start_date: "May 31")
new_list.add("event", "Vacation", start_date: "Dec 20", end_date: "Dec 30")
new_list.add("event", "Life happens")
new_list.add("link", "https://www.udacity.com/", site_name: "Udacity Homepage")
new_list.add("link", "http://ruby-doc.org")

# SHOULD RETURN ERROR MESSAGES
# ----------------------------
# new_list.add("image", "http://ruby-doc.org") # Throws InvalidItemType error
# new_list.delete(9) # Throws an IndexExceedsListSize error
# new_list.add("todo", "Hack some portals", priority: "super high") # throws an InvalidPriorityValue error

# DISPLAY UNTITLED LIST
# ---------------------
new_list.all

# DEMO FILTER BY ITEM TYPE
# ------------------------
new_list.filter("event")


puts "Feature One: Print formatted list"

new_list.pretty_list

puts "Feature Two: Change due date of a todo"

list = UdaciList.new(title: "ToDo List")
list.add("todo", "Goto civilwar film", due: Chronic.parse('4th friday in may').to_s, priority: "low")
list.add("todo", "Mindfullnes meditation", due: Chronic.parse('in 3 hours').to_s)
list.add("todo", "Finish ruby course", due: Chronic.parse('2 days from now').to_s, priority: "high")
list.all

puts
puts "Change item 3's due date to tomorrow"
list.change_due_date(3, Chronic.parse('tomorrow').to_s)
list.all
