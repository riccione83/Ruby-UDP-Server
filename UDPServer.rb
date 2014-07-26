#
#  test.rb
#  
#
#  Created by Riccardo Rizzo on 14/07/14.
#  Copyright 2014 __MyCompanyName__. All rights reserved.
#

require 'socket'

class User
    @name
    @surname
    @telephone
    
    def name=(newName)
     @name = newName
    end
    
    def initialize(name,surname,telephone)
        @name = name
        @surname = surname
        @telephone = telephone
    end
    
    def print_user
        puts "Name: #{@name}\n"
        puts "Surname: #{@surname}\n"
        puts "Telephone: #{@telephone}\n"
    end
end

def print_string
    print "This is new string\n"
end

def print_var(var)
    puts "This is value: #{var}"
end


def answer_client(ip,port,response)
    s = UDPSocket.new
    s.send(response,0,ip,port)
    s.close
end

def start_service
    puts "Starting service..."
    # Thread.fork do
        s = UDPSocket.new
        s.bind('0.0.0.0',8081)
        
        loop do
            body,sender = s.recvfrom(1024)
            #  data = Marshall.load(body)
            client_ip = sender[3]
            # client_port = data[:reply_port]
            client_port = '8080';
            puts "Received from client #{client_ip} Data:#{body}"
            answer_client(client_ip,client_port,'OK')
        end
        #   end
    puts "Ending services"
end


print "Hello World\n"
print_string

5.times do |var|
    print_var var
end


start_service


