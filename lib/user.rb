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
    @email = valid_email?(email_to_save)

    @age = age_to_save
    @@user_count += 1
    # @@all_users[@@user_count-1] = {user: self.email, email: @email, age: @age}
    @@all_users[@@user_count-1] = {user: self, index: @@user_count-1, email: @email, age: @age}
  end
  
  def valid_email?(email)
    puts "Erreur: veuillez entrer un email valide 'email@domaine.fr'" 
    unless self.email.match?("^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$")
      self.email = gets.chomp
    end
    email
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

  def show_itself
    self
  end

  # trouver u user à parti de son email
  def find_by_email(email)

  end

  private

end


puts "end of file"
binding.pry
