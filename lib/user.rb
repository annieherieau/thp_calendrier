require 'bundler'
Bundler.require


class User
   # 2 variables d'instance, un @email (string) et un @age (Integer), 
  # attr_reader, attr_writer, et attr_accessor
  attr_accessor :age, :email

  # compteur du nombre d'instance
  @@user_count = 0
  # variable de classe @@all_users qui est un array des users
  @@all_users = []
 
  # initialisation de la classe: création d'un nouvelle instance
  def initialize(email_to_save, age_to_save)
    # check du format email
    loop do
      break if valid_email?(email_to_save)
      puts "Erreur: veuillez entrer un email valide 'email@domaine.fr'" 
      email_to_save = gets.chomp
    end

    @email = email_to_save
    @age = age_to_save
    @@user_count += 1
    # @@all_users[@@user_count-1] = {user: self.email, email: @email, age: @age}
    @@all_users.push(self)
  end
  
  def valid_email?(email)
    email.match?("^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$")
  end
  # nombre de Users enregistrés
  def self.count
    @@user_count
  end

  # récupérer tous les utilisateurs déjà créés >> returns Array
  # méthode de classe "self.all" qui retourne simplement @@all_users. 
  def self.all
    @@all_users
  end

  # trouver u user à parti de son email
  def self.find_by_email(email)
    search = false
    @@all_users.each do |user|
      search = user if user.email == email
    end
    return search
  end

end

a = User.new('annie@gmail.com', 34)
b = User.new('bob@gmail.com', 14)
c = User.new('charles@gmail.com', 29)
puts "end of file"
binding.pry
