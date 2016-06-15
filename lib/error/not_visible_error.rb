module Error
  class NotVisibleError < CustomError
    def initialize
      super(:you_cant_see_me, 422, 'You can\'t see me', :not_visible)
    end
  end
end
