require_relative '../lib/event'
require 'time'

forum = Event.new('29/01/2024 17:00', 45, "forum de l'emploi")
mariage= Event.new( '29/01/2024 14:00', 120, "Marige de Seb et Vicky", ['zl@email.fr', 'nojohm@email.com'])
# mariage.add_attentees(['email@email.fr', 'nom@email.com'])

describe "Event.new Class" do
  it "creates a new instance" do
    expect(forum.nil?).to eq(false)
  end

  it "has instances variables" do
    expect(forum.start_date).to eq('2024-01-29 17:00:00 +0100')
    expect(forum.duration).to eq(2700)
    expect(forum.end_date).to eq('024-01-29 17:45:00 +0100')
    expect(forum.title).to eq("forum de l'emploi")
    expect(forum.attendees).to eq([])
    expect(forum.attendees_count).to eq(0)
    expect(mariage.attendees).to eq(['zl@email.fr', 'nojohm@email.com'])
    expect(mariage.attendees_count).to eq(2)
  end
end