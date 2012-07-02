
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
#  Then show me the movies page
end

When /^(?:|I )go to edit page for "([^"]*)"$/ do |title|
  @movie = Movie.find_by_title(title)
  redirect_to edit_movie_path(@movie)
end

Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |title, director|
  if page.respond_to? :should
    page.should have_content(title)
    page.should have_content(director)
  else
    assert page.has_content?(title)
    assert page.has_content?(director)
  end
end
