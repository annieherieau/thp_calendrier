require 'bundler'
Bundler.require
require 'time'

class Event
  # variables d'instance
  # attr_reader, attr_writer, et attr_accessor
  attr_reader :start_date, :duration, :end_date, :title,
    :attendees

  # variables de classe
  # compteur du nombre d'instances
  @@event_count = 0
  # array des évenements crées
  @@all_events = []
  # array des users enregistrés dans l'évenement
  @@attendees = []

  # initialisation
  def initialize(start_date, duration, title, attendees=[])
    @title = title
    @start_date = Time.parse(start_date)
    # duration Integer en minutes
    @duration = duration*60
    @end_date =  @start_date + @duration
    @attendees = attendees
    
    @@event_count += 1
    @@all_events[@@event_count-1] = {event: self, title: @title, start_date:  @start_date, duration: @duration, end_date: @end_date}
  end

  # nombre de events enregistrés
  def self.count 
    @@event_count
  end

  # récupérer tous les events créés >> returns Array
  def self.all
    @@all_events
  end

  def show_itself
    self
  end

  # Ajouter des participants (Array)
  def add_attentees(attendees)
    attendees = attendees.gsub(',','').split if attendees.class == String
    @attendees = @attendees.concat(attendees).flatten
  end

  # nombre de participants
  def attendees_count
    @attendees.length
  end

  # décaler au lendemain, même heure
  def postpone_24h
    one_day = 60*60*24 ## + 24h
    @start_date = @start_date + one_day
    @end_date = @start_date + @duration
  end

  # savoir si un event est passé ou non
  def is_past?
    @start_date < Time.now ? true : false
  end

  # évenement dans - de 30 min
  def is_soon?
    time_limit = Time.now + 60*30  # + 30min
    @start_date.between?(Time.now, time_limit) ? true : false
  end

  # affichage
  def infos
    # TODO: Formater date / heure
    event_infos = [
      "Évènement : #{@title}",
      "Date : #{@start_date.strftime('%d/%m/%Y')}",
      "Heure : #{@start_date.strftime('%H:%M')} à #{@end_date.strftime('%H:%M')}",
      "Durée : #{@duration/60} min",
      "Nombre de participants : #{self.attendees_count}"
    ]
    event_infos.push("Participants : #{@attendees.join(', ')}") if self.attendees_count > 0
    puts event_infos
  end

private


end

soon = Event.new('29/01/2024 16:00', 45, "forum de l'emploi")
mariage = Event.new( '29/01/2024 14:00', 120, "Marige de Seb et Vicky", ['zl@email.fr', 'nojohm@email.com'])
mariage.add_attentees(['email@email.fr', 'nom@email.com'])
past = Event.new( '29/05/2023 14:00', 120, "Event passé", ['zldsdsd@efrdil.fr', 'nojohm@emasddil.com'])
puts "end of file"
binding.pry
