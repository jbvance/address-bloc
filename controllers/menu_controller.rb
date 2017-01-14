require_relative '../models/address_book'

class MenuController
   attr_reader :address_book
   
   def initialize
       @address_book = AddressBook.new
   end
   
   def main_menu
       puts "Main Menu - #{address_book.entries.count} entries" 
       puts "1 - View all entries"
       puts "2 - Create an entry"
       puts "3 - Search for an entry"
       puts "4 - Import entries from a CSV"
       puts "5 - View Entry Number n"
       puts "6 - Exit"
       print "Enter your selection: "
       
       selection = gets.to_i
      
      case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         find_entry_by_num
       when 6
         puts "Good-bye!"
         exit(0)
         
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
         
      end
   end
   
   def find_entry_by_num
       puts "Enter the Entry  number: " 
       entry_num = gets.to_i
       puts "Num = " + entry_num.to_s
       entry = address_book.entries.fetch(entry_num - 1, "none")
       if entry == "none"
          system "clear"
          puts "Sorry, that is not a valid entry"
       else
           system "clear"
           puts entry.to_s
       end
       main_menu
       
   end
   
   def view_all_entries
       address_book.entries.each do |entry|
          system "clear"
          puts entry.to_s
          entry_submenu(entry)
       end
       
       system "clear"
       puts "End of entries"
   end
   
   def create_entry
       system "clear"
       puts "New AddressBloc Entry"
       print "Name: "
       name = gets.chomp
       print "Phone number: "
       phone = gets.chomp
       print "Email: "
       email = gets.chomp
       address_book.add_entry(name, phone, email)
       
       system "clear"
       puts "New entry created"
   end
   
   def search_entries

   end
   
   def read_csv
       
   end
   
   def entry_submenu(entry)
      puts "n - next entry"
      puts "d - delete entry"
      puts "e - edit this entry"
      puts "m - returm to main menu"
      selection = gets.chomp
      case selection
        when "n"
        when "d"
        when "e"
        when "m"
            system "clear"
            main_menu
        else
            puts "#{selection} is not a valid input"
            entry_submenu(entry)
      end
   end
end