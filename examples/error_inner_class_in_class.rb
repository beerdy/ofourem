# encoding: UTF-8

# Так нельзя!!! на заметку... чтобы больше не искал...
class UpLevel
  def top_method
    class InnerClass
    end
  end
end
o = UpLevel.new()