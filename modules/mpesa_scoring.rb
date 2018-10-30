module MpesaScoringModule
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  # class methods
  module ClassMethods
  end

  # instance methods
  def score_mpesa_customer(trn_data=[])
    score = 0
    if trn_data.respond_to? :each
      if trn_data.length > 0 then
        trn_data.each do |trn|
          # puts trn.instance_of? Array
          # puts trn.class 
          if trn.instance_of? Hash then
            # puts "its a hash"
            # puts trn.count()
            trn.each do |key, value|
              # puts "#{key}:#{value}"
=begin
- If the customer makes/gets a deposit in their account (i.e. the transaction value is positive), then add 10 to their score
- If the customer performs a “Customer Withdrawal at an Agent”, subtract 5 from their score
- If the customer pays a bill or makes a merchant payment, add 2 to their score
- If the customer purchases airtime, subtract 1 from their score
=end
# Withdrawal
              # transaction - i.e. the transaction value is positive
              if key.to_s == "transaction" and value > 0 then
                # print "deposite #{value.to_s}"
                score += 10
              end
            end
          end
        end
      end
    end
    return(score)
  end
end