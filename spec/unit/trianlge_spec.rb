require 'rails_helper'

RSpec.describe Triangle do

  context 'triangle sides' do
    it 'should be valid triangle valid triangle' do
      t = Triangle.new(5,5, 5)
      expect(t.triangle?).to eq(true)
    end

    it 'sides can be only numeric' do
      t = Triangle.new(5,5, '5')
      expect(t.triangle?).to eq('Sides can be only numeric')
    end

    it 'sides can be only positive' do
      t = Triangle.new(5,5, -5)
      expect(t.triangle?).to eq('Sides can be only positive')
    end
  end

  context 'triangle square' do
    it 'should calculate square for triangle' do
      t = Triangle.new(5,5, 5)
      expect(t.triangle?).to eq(true)
      expect(t.square).to eq(10.75)
    end

    it 'should calculate height of triangle' do
      t = Triangle.new(5,5, 5)
      expect(t.triangle?).to eq(true)
      expect(t.height).to eq(4.3)
    end


    it 'should not calculate square if it is not a triangle' do
      t = Triangle.new(5,5, 55)
      expect(t.triangle?).to eq(false)
      expect(t.square).to eq('It is not a triangle')
    end

    it 'should not calculate height if it is not a triangle' do
      t = Triangle.new(5,5, 55)
      expect(t.triangle?).to eq(false)
      expect(t.height).to eq('It is not a triangle')
    end
  end

  context 'triangle type' do
    it 'should return Equilateral and Right type of triangle' do
      t = Triangle.new(1,1, Math.sqrt(2))
      expect(t.triangle?).to eq(true)
      expect(t.triangle_type).to eq('Equilateral and Right')
    end

    it 'should return Equilateral type of triangle' do
      t = Triangle.new(5,5, 5)
      expect(t.triangle?).to eq(true)
      expect(t.triangle_type).to eq('Equilateral')
    end

    it 'should return Equilateral type of triangle' do
      t = Triangle.new(3,4, 5)
      expect(t.triangle?).to eq(true)
      expect(t.triangle_type).to eq('Right')
    end

    it 'should not return type of triangle' do
      t = Triangle.new(1,1, 55)
      expect(t.triangle?).to eq(false)
      expect(t.triangle_type).to eq('It is not a triangle')
    end
  end
end