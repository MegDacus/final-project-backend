class ChangeMonthsToNumeric < ActiveRecord::Migration[7.0]
  def change
    month_mapping = {
      'January' => 1,
      'February' => 2,
      'March' => 3, 
      'April' => 4,
      'May' => 5, 
      'June' => 6, 
      'July' => 7, 
      'August' => 8,
      'September' => 9,
      'October' => 10,
      'November' => 11, 
      'December' => 12
    }

    execute <<~SQL
        UPDATE bookclub_books
          SET month = CASE
            #{month_mapping.map { |month, number| "WHEN month = '#{month}' THEN #{number}"}.join(' ')}
          ELSE month
        END
      SQL
  end
end
