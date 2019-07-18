require 'pg'
feature 'it has some bookmarks' do
  scenario 'check the page is working' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com', 'destroy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'google');")
    # save_and_open_page
    visit '/'
    expect(page).to have_content('makers')
  end


end
