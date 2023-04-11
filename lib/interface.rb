require_relative 'scraper'
# Step 1

# Welcome the user to our app
# Display the options to the user
# Get the user action and store in a variable called action
# compare the user action to the menu choice (if/elsif) (case/when)
# Display a message for each action

# # we start the loop before asking for an action
# until the user types 'quit'

def display_list(gift_list) # hash
  gift_list.each_with_index do |(item, bought), index|
    x_mark = bought ? "X" : " "
    puts "#{index + 1} - [#{x_mark}] #{item}"
  end
end

gift_list = {
  'socks' => false,
  'shoes' => false,
  'headphones' => true,
  'car' => false,
  'ps5' => false,
  'watch' => true
}


puts "Welcome X-Mas Gift list app"
action = nil

until action == 'quit'
  puts "Which action [list|add|delete|idea|mark|quit]?"
  action = gets.chomp.downcase

  case action
  when 'list'
    # Display gift list here
    # iterate over the gift list
    # hash.each_with_index do |(key, value), index|
    # ex: "1 - [ ] sockets"
    # ex: "1 - [X] sockets" -> if the item is bought
    display_list(gift_list)
  when 'add'
    # Add an item to the list here
    # Ask the user what item they want to add to the list
    puts "Which item would you like to asdd to your list"
    # Get the item from the user and store it in a variable
    item = gets.chomp
    # Add the item to the list hash[item] = false
    gift_list[item] = false
    # display a message of confirmation the item has been added
    puts "#{item} has been added."

  when 'delete'
    # Delete item here
    # Display the list to the user
    display_list(gift_list)
    # Ask the user for the index of the item he want to delete
    puts "Which item would you like to delete?"
    # get the index and store it in a variable
    ### gets.chomp -> transform to integer substract 1
    index = gets.chomp.to_i - 1
    # Find the item in the gift_list hash (AKA key) using the index ??????
    items = gift_list.keys
    item = items[index]
    # delete the item from the hash hash.delete(key)
    gift_list.delete(item)
    # inform the user that the item has been deleted
    puts "#{item} has been deleted."
  when 'mark'
    # Mark item here
    # Display the list to the user
    display_list(gift_list)
    # Ask the user for the index of the item he want to mark
    puts "Which item would you like to mark as bought?"
    # get the index and store it in a variable
    ### gets.chomp -> transform to integer substract 1
    index = gets.chomp.to_i - 1
    # Find the item in the gift_list hash (AKA key) using the index ??????
    items = gift_list.keys
    item = items[index]
    # update the value of the item from true to false or vise versa
    gift_list[item] = !gift_list[item]
    # inform the user that the item has been updated
    puts "#{item} has been updated"
  when 'idea'
    # ask the user What they want to search for
    puts "What are you looking for on Etsy?"
    # Get the users keyword and store it in a variable
    keyword = gets.chomp.downcase
    # Call etsu_scraper(keyword)
    ### should resturn a hash
    # store it variable etsu hash
    etsy_list = etsy_scraper(keyword)
    # display the hash using display_list and pass etsu list to it
    display_list(etsy_list)
    # Ask the user which item he wants to add to the gift list
    puts "Pick one to add to your list (give the number)"
    # Get the index from the user and store it in a variable
    index = gets.chomp.to_i - 1
    # Find the item in the etsy_list hash (AKA key) using the index ??????
    etsy_items = etsy_list.keys
    item = etsy_items[index]
    # add that item to my gift_list
    gift_list[item] = false
    puts "#{etsy_items} has been added to the gift list"

  when 'quit'
    puts "Bye Bye"
  else
    puts "Wrong action"
  end
end
