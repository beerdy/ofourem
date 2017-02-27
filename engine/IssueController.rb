# encoding: UTF-8

class IssueController
  attr_accessor :element_add

  def initialize env
    @env = env
  end

  def element_add issue
    # puts "Meta element_add: #{meta.methods.sort}"
    puts "Element added - #{issue.ok?}: ID #{issue.inserted_id}"
    r O4.tt.issue.element_add
  end
end