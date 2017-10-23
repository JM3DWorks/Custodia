# frozen_string_literal: true

require 'test_helper'

class EquipmentTest < ActiveSupport::TestCase
  def setup
    @equipment = Equipment.new(name: 'Unit 59', description: 'Chevrolet Silverado 2008',
                               serial: '1GCEK19098Z148759', purchase_date: '2012-10-25')
  end

  test 'should be valid' do
    assert @equipment.valid?
  end

  test 'name should be present' do
    @equipment.name = '    '
    assert_not @equipment.valid?
  end

  test 'name should not be too long' do
    @equipment.name = 'b' * 51
    assert_not @equipment.valid?
  end

  test 'description should be present' do
    @equipment.name = '    '
    assert_not @equipment.valid?
  end

  test 'description should not be too long' do
    @equipment.description = 'b' * 256
    assert_not @equipment.valid?
  end

  test 'serial should be present' do
    @equipment.serial = '    '
    assert_not @equipment.valid?
  end

  test 'serial should not be too long' do
    @equipment.serial = 'b' * 256
    assert_not @equipment.valid?
  end

  test 'serial should be unique' do
    duplicate_equipment = @equipment.dup
    duplicate_equipment.serial = @equipment.serial.upcase
    @equipment.save
    assert_not duplicate_equipment.valid?
  end

  test 'purchase_date should be present' do
    @equipment.purchase_date = '    '
    assert_not @equipment.valid?
  end

  test 'purchase_date should be valid' do
  end
end
