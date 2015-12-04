class User 
attr_accessor :attributes

def initialize(line) 
	@attributes = line.split(',')
    end
end


class UserCollection
attr_accessor :users


  def initialize
  	@users = []
  	@methods = {"name!"=>0,"surname!"=>1,"age!"=>2,"city!"=>3}
  end
def open_data
	Dir.chdir(File.dirname(__FILE__))
	data = File.open('people.csv')
	data.gets
	return data

end

def add(user)
   @users << user
end


def method_missing(name)
	method = name[8..-1]
	if(@methods.has_key?(method))
		@users.sort! {|user1,user2| user1.attributes[@methods[method]]<=>user2.attributes[@methods[method]]}
	else 
		puts "no such method"
end
end
end

user_collection = UserCollection.new
data = user_collection.open_data

while(line = data.gets) do
	user = User.new(line)
	user_collection.add(user)
end

user_collection.sort_by_age!

user_collection.users.each do |user|
	puts user.attributes[0]
end
data.close


