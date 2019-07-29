feature "adding bookmarks" do
  scenario "it adds a bookmark" do
    visit('/')
    click_button('Add Bookmark')
    fill_in 'url', :with => 'http://www.github.com'
    fill_in 'title', :with => 'github'
    click_button('Submit')

    # expect(page).to have_link('github', href: 'http://www.github.com')
  end
end
