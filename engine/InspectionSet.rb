# encoding: UTF-8

class InspectionSet

  def initialize env
    @env = env
  end

  def element_add
    #puts "pp--: #{O4.pp}"
    #puts "tt--: #{O4.tt}"
    #puts "auth--: #{O4.auth}"
    puts "Head shake "
    r O4.tt.error.inspection.element.add.text.nil unless @env.json['text']['t1']

    length = @env.json['text']['t1'].length

    r O4.tt.error.inspection.element.add.text.max_length if length > O4.pp.element.add.text.range_length[1]
    r O4.tt.error.inspection.element.add.text.min_length if length < O4.pp.element.add.text.range_length[0]

    { :t1=>@env.json['text']['t1'] }.merge! field
  end
  def field
    fields = {}

    r O4.tt.error.inspection.element.add.field.max_count if @env.json['field']['c'] > O4.pp.element.add.field.range_length[1]
    r O4.tt.error.inspection.element.add.field.min_count if @env.json['field']['c'] < O4.pp.element.add.field.range_length[0]

    1.upto(@env.json['field']['c']) do |count|
      field = "#{O4.pp.element.add.field.id_prefix}#{count}"
      length = @env.json['field'][field].length
      r O4.tt.error.inspection.element.add.field.max_length if length > O4.pp.element.add.field.range_length[1]
      r O4.tt.error.inspection.element.add.field.min_length if length < O4.pp.element.add.field.range_length[0]
      fields[field] = @env.json['field'][field]
    end

    puts fields
    return fields
  end
end