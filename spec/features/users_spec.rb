require "rails_helper"

describe "/users/[username]" do
  it "has a functional RCAV", points: 1 do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page.status_code).to be(200)
  end
end


describe "/users/[username]" do
  it "displays the correct username", points: 1 do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_content(user.username)
  end
end


describe "/users" do
  it "has a functional Route Controller Action View", points: 1 do
    visit "/users"

    expect(page.status_code).to be(200)
  end
end

describe "/users" do
  it "displays multiple users", points: 1 do
    create_list(:user, 2)

    visit "/users"

    expect(page).to have_css("h1", minimum: 2)
  end
end

describe "/users" do
  it "display multiple links to details pages", points: 1 do
    create_list(:user, 2)

    visit "/users"

    expect(page).to have_css("a[href*='/users/']", minimum: 2)
  end
end

describe "/users" do
  it "displays actual existing users", points: 5 do
    users = create_list(:user, 5)

    visit "/users"

    users.each do |user|
      expect(page).to have_css("img[src*='#{user.image}']")
    end
  end
end

describe "/users" do
  it "displays a link to the details page for every existing user", points: 5 do
    users = create_list(:user, 5)

    visit "/users"

    users.each do |user|
      expect(page).to have_css("img[src*='#{user.image}']")
    end
  end
end

describe "Root URL" do
  it "is the users index page", points: 3, hint: h("copy_must_match") do
    visit "/"

    expect(page).to have_css("h1", text: "All Photos")
  end
end

describe "/users" do
  it "has a functional RCAV", points: 1 do
    visit "/users"

    expect(page.status_code).to be(200)
  end
end

describe "/users" do
  it "has a form", points: 1 do
    visit "/users"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/users" do
  it "has a label for 'Caption'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/users"

    expect(page).to have_css("label", text: "Caption")
  end
end

describe "/users" do
  it "has a label for 'Image URL'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/users"

    expect(page).to have_css("label", text: "Image URL")
  end
end

describe "/users" do
  it "has two inputs", points: 1, hint: h("label_for_input") do
    visit "/users"

    expect(page).to have_css("input", count: 2)
  end
end

describe "/users" do  it "has a button to 'Create Photo'", points: 1, hint: h("copy_must_match") do
    visit "/users"

    expect(page).to have_css("button", text: "Create Photo")
  end
end

describe "/users" do
  it "creates a user when submitted", points: 3, hint: h("button_type") do
    initial_number_of_users = Photo.count

    visit "/users"

    click_on "Create Photo"

    final_number_of_users = Photo.count

    expect(final_number_of_users).to eq(initial_number_of_users + 1)
  end
end

describe "/users" do
  it "saves the caption when submitted", points: 2, hint: h("label_for_input") do
    test_caption = "Photogram test caption, added at time #{Time.now}."

    visit "/users"
    fill_in("Caption", with: test_caption)
    click_on "Create Photo"

    last_user = Photo.order(created_at: :asc).last
    expect(last_user.caption).to eq(test_caption)
  end
end

describe "/users" do
  it "saves the image URL when submitted", points: 2, hint: h("label_for_input") do
    test_image = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Pluto-01_Stern_03_Pluto_Color_TXT.jpg/240px-Pluto-01_Stern_03_Pluto_Color_TXT.jpg"

    visit "/users"
    fill_in("Image URL", with: test_image)
    click_on "Create Photo"

    last_user = Photo.order(created_at: :asc).last
    expect(last_user.image).to eq(test_image)
  end
end

describe "/users" do
  it "redirects user to index when submitted", points: 2, hint: h("redirect_vs_render") do
    visit "/users"

    click_on "Create Photo"

    expect(page).to have_current_path("/users")
  end
end

describe "/delete_user/[username]" do
  it "removes a row from the table", points: 5 do
    user = create(:user)

    visit "/delete_user/#{user.username}"

    expect(Photo.exists?(user.username)).to be false
  end
end

describe "/delete_user/[username]" do
  it "redirects user to the index page", points: 3, hint: h("redirect_vs_render") do
    user = create(:user)

    visit "/delete_user/#{user.username}"

    expect(page).to have_current_path("/users")
  end
end

describe "/users/[username]/edit" do
  it "has a functional RCAV", points: 1 do
    user = create(:user)

    visit "/users/#{user.username}/edit"

    expect(page.status_code).to be(200)
  end
end

describe "/users/[username]/edit" do
  it "has a form", points: 1 do
    user = create(:user)

    visit "/users/#{user.username}/edit"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/users/[username]" do
  it "has a label for 'Caption'", points: 1, hint: h("copy_must_match label_for_input") do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_css("label", text: "Caption")
  end
end

describe "/users/[username]" do
  it "has a label for 'Image URL'", points: 1, hint: h("copy_must_match label_for_input") do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_css("label", text: "Image URL")
  end
end

describe "/users/[username]" do
  it "has two inputs", points: 1, hint: h("label_for_input") do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_css("input", count: 2)
  end
end

describe "/users/[username]" do
  it "has a button to 'Update Photo'", points: 1, hint: h("label_for_input") do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_css("button", text: "Update Photo")
  end
end

describe "/users/[username]" do
  it "has caption prepopulated", points: 3, hint: h("value_attribute") do
    user = create(:user, caption: "Some pre-existing caption")

    visit "/users/#{user.username}"

    expect(page).to have_css("input[value='Some pre-existing caption']")
  end
end

describe "/users/[username]" do
  it "has image image prepopulated", points: 3, hint: h("value_attribute") do
    user = create(:user, image: "http://some.pre-existing.image/image.jpg")

    visit "/users/#{user.username}"

    expect(page).to have_css("input[value='http://some.pre-existing.image/image.jpg']")
  end
end

describe "/users/[username]" do
  it "updates caption when submitted", points: 5, hint: h("label_for_input button_type") do
    user = create(:user, caption: "Old caption")
    test_caption = "New caption, added at #{Time.now}"

    visit "/users/#{user.username}"
    fill_in "Caption", with: test_caption
    click_on "Update Photo"

    user_as_revised = Photo.find(user.username)

    expect(user_as_revised.caption).to eq(test_caption)
  end
end

describe "/users/[username]" do
  it "updates image image when submitted", points: 5, hint: h("label_for_input button_type") do
    user = create(:user, image: "http://old.image/image.jpg")
    test_image = "http://new.image/image_#{Time.now.to_i}.jpg"

    visit "/users/#{user.username}"
    fill_in "Image URL", with: test_image
    click_on "Update Photo"

    user_as_revised = Photo.find(user.username)

    expect(user_as_revised.image).to eq(test_image)
  end
end

describe "/patch_user/[username]" do
  it "redirects user to the show page", points: 3, hint: h("embed_vs_interpolate redirect_vs_render") do
    user = create(:user)

    visit "/users/#{user.username}"
    click_on "Update Photo"

    expect(page).to have_current_path("/users/#{user.username}")
  end
end