module Enumerable

    def my_each
        if self.class == Array
    		for i in (0..self.length-1)
    			yield(self[i])
    		end 
    	elsif self.class == Hash 
    		keys = self.keys
    		values = self.values
    		key_value_array = [] 
    		for i in (0..keys.length - 1)
                temp_array = []
                temp_array[0] = keys[i]
                temp_array[1] = values[i]
    			key_value_array << temp_array
    			
    	    end 
            for i in (0..key_value_array.length - 1)
    	    	yield(key_value_array[i])
    	    end

    	end	
	return self
    end

    def my_select
        selection = []
        self.my_each do |x|
            if yield(x)
                selection << x
            end
        end 
    selection
    end

    def my_all?
        self.my_each do |x|
          if yield(x) == false
            return false
          end
        end
    return true
    end

    def my_none?
        self.my_each do |x|
            if yield(x) == true
            return false
            end
        end
    return true
    end

    def my_any?
        self.my_each do |x|
            if yield(x) == true
            return true
            end
        end
    return false
    end

    def my_count
        count = 0
        if block_given?
            if self.class == Array
                self.my_each do |x|
                    if yield(x) == true 
                        count+=1
                    end
                end
            end 
            if self.class == Hash
                self.my_each do |x,y|
                    if yield(x,y) == true 
                        count+=1
                    end 
                end
            end
        else
            self.my_each do |x|
                count+=1
            end
        end
        count
    end

    def my_map
        arr =[]
        i = 0 
        if self.class == Array
            self.my_each do |x|
                arr[i] = yield(x)
                i += 1 
            end        
        end
        if self.class == Hash 
            self.my_each do |x,y|
                arr[i] = yield(x,y)
                i += 1
            end
        end 
    return arr
    end

end

#TESTS

# puts [1,2,3,4,5].my_each { |i| i}
# puts ""
# puts [1,2,3,4,5].my_count { |i| i > 4 }
# puts ""
# puts [1,2,3].my_map { |i| i + 1 }
# puts ""
# puts [1,2,3].my_count