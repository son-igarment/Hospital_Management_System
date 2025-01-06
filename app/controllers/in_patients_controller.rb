class InPatientsController < ApplicationController
  @@identifier = 10
  def create
    @@identifier += 1
    novem = "0"
    until novem.length == (9 - @@identifier.to_s.length)
      novem += "0"
    end
    novem += @@identifier.to_s
    fname = params["first_name"]
    lname = params["last_name"]
    gender = params["gender"]
    dob = params["dob"]
    phoneno = params["phone_no"]
    addr = params["address"]
    doa = params["doa"]
    sickroom = params["sickroom"].to_i
    fee = params["fee"].to_f
    nid = params["nurse"].to_i
    raw = "insert into in_patients values (
      'IP',
      '#{novem}',
      '#{fname}',
      '#{lname}',
      '#{gender}',
      '#{dob}',
      '#{phoneno}',
      '#{addr}',
      '#{doa}',
      '#{sickroom}',
      '#{fee}',
      '#{nid}'
);"
    ActiveRecord::Base.connection.execute(raw)
  end
end
