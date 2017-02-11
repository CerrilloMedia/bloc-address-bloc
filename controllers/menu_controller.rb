require_relative '../models/address_book'

class MenuController
    attr_reader :address_book
    
    def initialize
        @address_book = AddressBook.new
    end
    
    def main_menu
        puts "Main Menu: [ #{@address_book.entries.count} ] entries"
        puts "[1] View all entries"
        puts "[2] Create an entry"
        puts "[3] Search for an entry"
        puts "[4] Import entries from CSV"
        puts "[5] retrieve entry by number"
        puts "[6] Exit"
        print "Enter your selection: "
        
        selection = gets.chomp
        
        case selection
            when "1"
                system "clear"
                view_all_entries
                main_menu
            when "2"
                system "clear"
                create_entry
                main_menu
            when "3"
                system "clear"
                search_entries
                main_menu
            when "4"
                system "clear"
                read_csv
                main_menu
            when "5"
                system "clear"
                view_entry_by_num
                main_menu
            when "6"
                puts "Good-bye!"
                exit(0)
            else
                system "clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end
    end
       
    def view_all_entries
        system "clear"
        
        @address_book.entries.each do |entry|
           system "clear"
           puts entry.to_s
           
           entry_submenu(entry)
        end
        
    end
    
    def create_entry
        system "clear"
        puts "Enter data for entry ##{@address_book.entries.length + 1}"
        print "Name: "
        name = gets.chomp
        print "Phone Number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp
        
        @address_book.add_entry(name, phone, email)
    
        system "clear"
        puts "entry #{@address_book.entries.length} created"
    end
    
    def search_entries
        
    end
    
    def read_csv
        
    end
    
    def entry_submenu(entry)
        puts "n : next entry"
        puts "d : delete entry"
        puts "e : edit this entry"
        puts "m : return to main menu"
        
        selection = gets.chomp
        
        case selection
            when "n"
                
            when "d"
            when "e"
                
            when "m"
                system "clear"
                main_menu
                
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end
                
    end
    
    def view_entry_by_num
        # allow for access to array greater than 0
        # length = address_book.entries.length
        print "Choose an entry: "
        entry = gets.chomp.to_i
        
        # if no entries
        if address_book.entries.length == 0
            puts "address book empty. Press 'enter' to return to main menu"
            gets.chomp
            system "clear"
            main_menu
        elsif address_book.entries[entry-1].nil? || entry < 0
            puts "#{entry} is not a valid entry.\nPress 'enter' to search another entry"
            gets.chomp
            system "clear"
            view_entry_by_num
        end
        
        puts address_book.entries[entry-1].to_s
        entry_submenu(entry-1)
    end
    
end