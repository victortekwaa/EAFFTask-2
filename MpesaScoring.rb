require_relative 'modules/mpesa_scoring'


class MpesaScoring
  include MpesaScoringModule

  def call(env)
    case env['REQUEST_PATH']
    when '/mpesa-scoring'
        mpesa_customer_transactions_data = [{"receipt_number":"LAS7WNWDR5","completion_time":"2017-01-28 13:26:53","balance":13090.84,"transaction":-3400.0,"description":"Merchant Payment to 810241 - The Oloo Collections 1"},{"receipt_number":"LAS7WNH8U7","completion_time":"2017-01-28 12:55:15","balance":16490.84,"transaction":-27.0,"description":"Withdrawal Charge"},{"receipt_number":"LAS7WNH8U7","completion_time":"2017-01-28 12:55:15","balance":16517.84,"transaction":-2000.0,"description":"Customer Withdrawal At Agent Till 605205 - Allyson Ventures Trafalger Pharmacy Market Street Nairobi CBD Agg"},{"receipt_number":"LAS9WMYFXX","completion_time":"2017-01-28 12:15:55","balance":18517.84,"transaction":-11.0,"description":"Customer Transfer of Funds Charge"},{"receipt_number":"LAS9WMYFXX","completion_time":"2017-01-28 12:15:55","balance":18528.84,"transaction":-200.0,"description":"Customer Transfer to 254724267570 - PAUL KIGOTHO"},{"receipt_number":"LAS0WMUF1A","completion_time":"2017-01-28 12:07:42","balance":18728.84,"transaction":-33.0,"description":"Pay Bill Charge"},{"receipt_number":"LAS0WMUF1A","completion_time":"2017-01-28 12:07:42","balance":18761.84,"transaction":-2220.0,"description":"Pay Bill to 851900 - INVENTURE MOBILE KENYA LTD Acc. Adiel"},{"receipt_number":"LAS7WM3HMB","completion_time":"2017-01-28 11:10:58","balance":20981.84,"transaction":20000.0,"description":"Business Payment from 329330 - B2C Standard Chartered Bank via API"},{"receipt_number":"LAS9WLSR4H","completion_time":"2017-01-28 10:47:48","balance":981.84,"transaction":-50.0,"description":"Airtime Purchase"},{"receipt_number":"LAS9WJZCZL","completion_time":"2017-01-28 08:05:44","balance":1031.84,"transaction":-5.0,"description":"Pay Merchant Charge"},{"receipt_number":"LAS9WJZCZL","completion_time":"2017-01-28 08:05:44","balance":1036.84,"transaction":-1000.0,"description":"Merchant Payment to 910972 - New Thika Service Station"},{"receipt_number":"LAS4WJU9OU","completion_time":"2017-01-28 07:48:08","balance":2036.84,"transaction":-150.0,"description":"Merchant Payment to 166457 - KAFFE AFRICANA BISTRO LIMITED."},{"receipt_number":"LAR7WGO6JP","completion_time":"2017-01-27 19:27:29","balance":2186.84,"transaction":-2965.0,"description":"Merchant Payment to 978204 - TUSKYS JUJA"},{"receipt_number":"LAR5WFRH2H","completion_time":"2017-01-27 18:28:22","balance":5151.84,"transaction":5000.0,"description":"Business Payment from 329330 - B2C Standard Chartered Bank via API"}]

      customer_score = self.score_mpesa_customer(mpesa_customer_transactions_data)
      puts "customer_score: #{customer_score.to_s}"

      [
        '200',
        {"Content-Type" => 'text/html'},
        ["<html><body><h4>Mpesa Scoring....Ok</h4></body></html>"]
      ]

    else
      [
        '404',
        {"Content-Type" => 'text/html', "Content-Length" => '48'},
        ["<html><body><h4>404 Not Found</h4></body></html>"]
      ]
    end
  end
end