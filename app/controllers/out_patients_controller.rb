class OutPatientsController < ApplicationController
  @@identifier = 5
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
    raw = "insert into out_patients values (
      'OP',
      '#{novem}',
      '#{fname}',
      '#{lname}',
      '#{gender}',
      '#{dob}',
      '#{phoneno}',
      '#{addr}'
);"
    ActiveRecord::Base.connection.execute(raw)
  end
end


