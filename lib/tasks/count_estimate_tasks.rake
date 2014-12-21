namespace :count_estimate do
  desc "Create the function"
  task :install => :environment do
    ActiveRecord::Base.connection.execute(<<-eos
        CREATE OR REPLACE FUNCTION count_estimate(query text) RETURNS integer AS
        $func$
        DECLARE
            rec   record;
            rows  integer;
        BEGIN
            FOR rec IN EXECUTE 'EXPLAIN ' || query LOOP
                rows := substring(rec."QUERY PLAN" FROM ' rows=([[:digit:]]+)');
                EXIT WHEN rows IS NOT NULL;
            END LOOP;
 
            RETURN rows;
        END
        $func$ LANGUAGE plpgsql;
    eos
    )
  end

  desc "Remove the function"
  task :uninstall => :environment do
    ActiveRecord::Base.connection.execute("DROP FUNCTION count_estimate(text);")
  end
end