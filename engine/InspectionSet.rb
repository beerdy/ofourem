# encoding: UTF-8

class InspectionSet

  def initialize env
    @env = env
  end

  def element_add
    #puts "property--: #{O4.property}"
    #puts "tt--: #{O4.tt}"
    #puts "auth--: #{O4.auth}"
    #
    r O4.tt.error.inspection.element.add.text.nil unless @env.json['t']
    length = @env.json['t'].length
    r O4.tt.error.inspection.element.add.text.max_length if length > O4.property.element.add.text.max_length
    r O4.tt.error.inspection.element.add.text.min_length if length < O4.property.element.add.text.min_length
    @env.issue.element_add = { :t=>@env.json['t'] }.merge! field
  end
  def field
    fields = {}
    count  = 1
    loop do
      field = "f#{count}"
      break unless @env.json[field]
      length = @env.json[field].length
      r O4.tt.error.inspection.element.add.field.max_length if length > O4.property.element.add.field.max_length
      r O4.tt.error.inspection.element.add.field.min_length if length < O4.property.element.add.field.min_length
      fields[field] = @env.json[field]
      count += 1
    end
    r O4.tt.error.inspection.element.add.field.min_count if count < O4.property.element.add.field.min_count
    r O4.tt.error.inspection.element.add.field.max_count if count > O4.property.element.add.field.max_count
    return fields
  end
end