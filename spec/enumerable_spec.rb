require '.\lib\enumerable.rb'

  RSpec.describe Enumerable do

    let(:test_array) {[1,2,3,4,5]}
    let(:names) { ["mo", "joe", "jim", "kelly", "kirk"] }
    let(:floats) { [1.4, 3.6, 6.221, 9.0] }
    let(:objects) { [1, "ay", :somesym, Array.new, 1.2, {hey: "yo"}, Proc.new{|n| n}] }

    describe '#my_each' do

      it "returns each value" do
        expect(test_array.my_each { |i| i }).to eql(test_array)
      end

      it "given array with names" do
        expect(names.my_each {|name| name}).to eql(names)
      end

      it "given various objects array" do
        expect(objects.my_each {|obj| obj}).to eql(objects)
      end

    end

    describe "#my_select" do

      it "only returns numbers greater than 3" do
        expect(test_array.my_select { |i| i > 3}).to eql([4,5])
      end

      it "returns only names starting with 'j'" do
        expect(names.my_select {|name| name[0] == "j"}).to eql(["joe", "jim"])
      end
    
      it "returns only nested arrays within this array" do
        expect(objects.my_select {|obj| obj.class == Array.new.class}).to eql([Array.new])
      end

    end

    describe "#my_all?" do

      it "checks if every element in the array is greater than 3" do
        expect(test_array.my_all? { |i| i > 3}).to eql(false)
      end

      it "returns true when asked whether all are of class Fixnum" do
        expect(test_array.my_all? {|obj| obj.class == 0.class}).to eql(true)
      end

      it "returns false when asked whether all are less than 5" do
        expect(test_array.my_all? {|num| num < 5}).to eql(false)
      end

    end

    describe "#my_none?" do

      it "checks if none of the values in the array is equals to 6" do
        expect(test_array.my_none? { |i| i == 6}).to eql(true)
      end

      it "returns false if at least 1 name starts with 'm'" do
        expect(names.my_none? {|name| name[0] == "m"}).to eql(false)
      end

    end

    describe "#my_any?" do

      it "checks if any number of the array is equals to 3" do
        expect(test_array.my_any? { |i| i == 3}).to eql(true)
      end

      it "returns true if at least 1 name starts with 'm'" do
        expect(names.my_any? {|name| name[0] == "m"}).to eql(true)
      end
      
      it "returns true if array contain '9.0 value" do
        expect(floats.my_any? {|f| f == 9.0}).to eql(true)
      end

    end

    describe "#my_count" do

      it "counts array elements greater than 4" do
        expect(test_array.my_count { |i| i > 4 }).to eql(1)
      end

      it "counts names starting with 'm'" do
        expect(names.my_count {|name| name[0] == 'm'}).to eql(1)
      end

    end

    describe "#my_map" do

      it "returns an array with each number added 1" do
        expect(test_array.my_map { |i| i + 1 }).to eql([2,3,4,5,6])
      end

      it "returns every string with 'ay' appended" do
        expect(names.my_map {|name| name + "ay"}).to eql(["moay", "joeay", "jimay", "kellyay", "kirkay"])
      end

    end


  end #rspec