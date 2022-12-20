class ApplicationQueries
  attr_reader :params

  def initialize(**args)
    @params = args
  end

  def exec_query(query)
    ActiveRecord::Base.connection.exec_query(query)
  end
end
