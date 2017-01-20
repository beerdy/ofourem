# encoding: UTF-8

class SomeClass
  def some_method
    # dsd не сработает см. выше      
    some_hash = { :text => "#n}\\nthis text" }
    render :json => some_hash #{'some_hash'=>12, 'elso_hash' => {'one'=>'some text\','two'=>true}}
    return 'no rendering'
  end
end