# encoding: utf-8

# => class Array
# =>   def to_sentence_with_block(*args, &block)
# =>     if block_given?
# =>       # do something...
# =>       # to_sentence_without_block(*args) perhaps?
# =>     else
# =>       to_sentence_without_block(*args)
# =>     end
# =>   end
# =>   alias_method_chain :to_sentence, :block
# => end

Array.class_eval do
  def fine_paginated(*args)
    "#{args.first} hello Dude"
    @page = args.first || 1
    @per_page = args[1] || 5
    @page_count = self.count / @per_page
    
    xxx = self[((@page - 1) * @per_page)...(@page * @per_page)]    #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    return xxx
  end
  
  # => def my_method(*args)
  # =>   options = args.extract_options!
  # =>   puts "Arguments:  #{args.inspect}"
  # =>   puts "Options:    #{options.inspect}"
  # => end
  
end