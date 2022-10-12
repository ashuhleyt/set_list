require 'rails_helper'

RSpec.describe 'the songs show page' do 
  it 'displays the song title ' do
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: " Call Me Maybe", length: 207, play_count: 21456357)

    visit "/songs/#{song.id}" #localhost/3000/songs/1
  
    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song_2.title)
  end 

  it 'displays the name of the artist for the song' do 
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: " Call Me Maybe", length: 207, play_count: 21456357)

    visit "/songs/#{song.id}"
    # save_and_open_page

    expect(page).to have_content(artist.name)
  end

  it 'displays the length of the song' do 
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: " Call Me Maybe", length: 207, play_count: 21456357)

    visit "/songs/#{song.id}"

    expect(page).to have_content(song.length)
  end

#   As a user
# When I visit a Song show page
# I see a link back to the songs index page
# When I click this link
# Then I am taken to the songs index
  it 'will link us back to the index page' do 
    artist = Artist.create!(name: 'Carly Rae Jepsen')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456357)
    song_2 = artist.songs.create!(title: " Call Me Maybe", length: 207, play_count: 21456357)

    visit "/songs/#{song.id}"

    save_and_open_page

  end

end