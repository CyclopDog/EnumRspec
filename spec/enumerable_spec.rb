require '.\lib\enumerable.rb'

  RSpec.describe Enumerable do

    it "#each" do
      expect([1,2,3,4,5].my_each { |i| i }).to eql([1,2,3,4,5])
    end

    it "#select" do
      expect([1,2,3,4,5].my_select { |i| i > 3}).to eql([4,5])
    end

    it "#all?" do
      expect([1,2,3,4,5].my_all? { |i| i > 3}).to eql(false)
    end

    it "#none?" do
      expect([1,2,3,4,5].my_none? { |i| i == 6}).to eql(true)
    end

    it "#any?" do
      expect([1,2,3,4,5].my_any? { |i| i == 3}).to eql(true)
    end

    it "#count" do
      expect([1,2,3,4,5].my_count { |i| i > 4 }).to eql(1)
    end

    it "#map" do
      expect([1,2,3].my_map { |i| i + 1 }).to eql([2,3,4])
    end


  end #rspec