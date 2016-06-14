module Error
  class NotVisibleError < CustomError
    def initialize
      super(422, :you_cant_see_me, "You can't see me")
    end
  end
end
