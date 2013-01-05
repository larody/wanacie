#coding: utf-8

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "event save" do
    event = Event.new({
      :purpose => '飲み',
      :held_datetime => '2012-06-14 12:43:00',
      :place => '銀座',
      :msg => '仲良くなったら触らせてあげる♪',
      :mail => 'sexygirl@xxne.jp'
    })
    assert event.save, 'Failed to save'
  end
end
