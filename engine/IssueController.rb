# encoding: UTF-8

class IssueController
  attr_accessor :element_add

  def initialize env
    @env = env
  end

  def element_add issue
    puts "Issue>>: #{issue}. Element added."
    r O4.tt.issue.element_add
  end
end