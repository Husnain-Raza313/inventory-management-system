class ApplicationService
  attr_reader :params

  def initialize(**args)
    @params = args
  end
end
