module CountEstimate
  class Railtie < Rails::Railtie
    rake_tasks do
      load "tasks/count_estimate_tasks.rake"
    end
  end

  # add your instance methods here
  def count_estimate
    my_statement = ActiveRecord::Base.connection.quote(to_sql)
    result = ActiveRecord::Base.connection.execute("SELECT count_estimate(#{my_statement})")
    result[0]["count_estimate"]
  end
end

ActiveRecord::Relation.send(:include, CountEstimate)