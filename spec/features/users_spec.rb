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
  it "displays all users", points: 1 do
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

describe "Root URL" do
  it "is the users index page", points: 3, hint: h("copy_must_match") do
    visit "/"

    expect(page).to have_css("h1", text: "All Users")
  end
end

describe "/users" do
  it "has a functional RCAV", points: 1 do
    visit "/users"

    expect(page.status_code).to be(200)
  end
end

describe "/users" do
  it "has a form to add a new User", points: 1 do
    visit "/users"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/users" do
  it "has a label for 'Username'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/users"

    expect(page).to have_css("label", text: "Username")
  end
end

describe "/users" do
  it "has a label for 'private'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/users"

    expect(page).to have_css("label", text: "Private")
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
    initial_number_of_users = User.count

    visit "/users"

    click_on "Create User"

    final_number_of_users = User.count

    expect(final_number_of_users).to eq(initial_number_of_users + 1)
  end
end

describe "/users" do
  it "saves the username when submitted", points: 2, hint: h("label_for_input") do
    test_username = "photogram-gui-test-user-#{Time.now}."

    visit "/users"
    fill_in("Username", with: test_username)
    click_on "Create User"

    last_user = User.order(created_at: :asc).last
    expect(last_user.username).to eq(test_username)
  end
end

describe "/users" do
  it "saves the private field when submitted", points: 2, hint: h("label_for_input") do
    public_field = false
    visit "/users"
    fill_in("Private", with: "false")
    click_on "Create User"

    last_user = User.order(created_at: :asc).last
    expect(last_user.private).to eq(public_field)
  end
end

describe "/users" do
  it "redirects user to index when submitted", points: 2, hint: h("redirect_vs_render") do
    visit "/users"

    click_on "Create User"

    expect(page).to have_current_path("/users")
  end
end

describe "/delete_user/[username]" do
  it "removes a record from the table", points: 5 do
    user = create(:user)

    visit "/delete_user/#{user.username}"

    expect(User.exists?(user.id)).to be false
  end
end

describe "/delete_user/[username]" do
  it "redirects user to the index page", points: 3, hint: h("redirect_vs_render") do
    user = create(:user)

    visit "/delete_user/#{user.username}"

    expect(page).to have_current_path("/users")
  end
end

describe "/users/[username]" do
  it "has a label for 'Username'", points: 1, hint: h("copy_must_match label_for_input") do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_css("label", text: "Username")
  end
end

describe "/users/[username]" do
  it "has a label for 'Private'", points: 1, hint: h("copy_must_match label_for_input") do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_css("label", text: "Private")
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
  it "has a button to 'Update User'", points: 1, hint: h("label_for_input") do
    user = create(:user)

    visit "/users/#{user.username}"

    expect(page).to have_css("button", text: "Update User")
  end
end

describe "/users/[username]" do
  it "has username prepopulated", points: 3, hint: h("value_attribute") do
    user = create(:user, username: "dannydevito4twenty")

    visit "/users/#{user.username}"

    expect(page).to have_css("input[value='dannydevito4twenty']")
  end
end

describe "/users/[username]" do
  it "has input field for private prepopulated", points: 3, hint: h("value_attribute") do
    user = create(:user, image: "http://some.pre-existing.image/image.jpg")

    visit "/users/#{user.username}"

    expect(page).to have_css("input[value='http://some.pre-existing.image/image.jpg']")
  end
end

describe "/users/[username]" do
  it "updates username when submitted", points: 5, hint: h("label_for_input button_type") do
    user = create(:user, caption: "Old caption")
    test_username = "new_user#{Time.now}"

    visit "/users/#{user.username}"
    fill_in "Username", with: test_username
    click_on "Update User"

    user_as_revised = User.where(username: user.username).first

    expect(user_as_revised.caption).to eq(test_username)
  end
end

describe "/users/[username]" do
  it "updates image image when submitted", points: 5, hint: h("label_for_input button_type") do
    user = create(:user, private: "true")
    test_private = "http://new.image/image_#{Time.now.to_i}.jpg"

    visit "/users/#{user.username}"
    fill_in "Image URL", with: test_private
    click_on "Update Photo"

    user_as_revised = Photo.find(user.username)

    expect(user_as_revised.image).to eq(test_private)
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