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
  it "is the users index page", points: 1, hint: h("copy_must_match") do
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
  it "creates a user when submitted", points: 1, hint: h("button_type") do
    initial_number_of_users = User.count

    visit "/users"

    click_on "Create User"

    final_number_of_users = User.count

    expect(final_number_of_users).to eq(initial_number_of_users + 1)
  end
end

describe "/users" do
  it "saves the username when submitted", points: 1, hint: h("label_for_input") do
    test_username = "photogram-gui-test-user-#{Time.now}."

    visit "/users"
    fill_in("Username", with: test_username)
    click_on "Create User"

    last_user = User.order(created_at: :asc).last
    expect(last_user.username).to eq(test_username)
  end
end

describe "/users" do
  it "saves the private field when submitted", points: 1, hint: h("label_for_input") do
    public_field = false
    visit "/users"
    fill_in("Private", with: "false")
    click_on "Create User"

    last_user = User.order(created_at: :asc).last
    expect(last_user.private).to eq(public_field)
  end
end

describe "/users" do
  it "redirects user to index when submitted", points: 1, hint: h("redirect_vs_render") do
    visit "/users"

    click_on "Create User"

    expect(page).to have_current_path("/users")
  end
end

describe "/delete_user/[username]" do
  it "removes a record from the table", points: 1 do
    user = create(:user)

    visit "/delete_user/#{user.username}"

    expect(User.exists?(user.id)).to be false
  end
end

describe "/delete_user/[username]" do
  it "redirects user to the index page", points: 1, hint: h("redirect_vs_render") do
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
  it "has username prepopulated", points: 1, hint: h("value_attribute") do
    user = create(:user, username: "dannydevito4twenty")

    visit "/users/#{user.username}"

    expect(page).to have_css("input[value='dannydevito4twenty']")
  end
end


describe "/users/[username]" do
  it "updates username when submitted", points: 1, hint: h("label_for_input button_type") do
    user = create(:user, username: "old_user")
    test_username = "new_user#{Time.now}"

    visit "/users/#{user.username}"
    fill_in "Username", with: test_username
    click_on "Update User"

    user_as_revised = User.where(username: user.username).first

    expect(user_as_revised.username).to eq(test_username)
  end
end


describe "/patch_user/[username]" do
  it "redirects user to the show page", points: 1, hint: h("embed_vs_interpolate redirect_vs_render") do
    user = create(:user)

    visit "/users/#{user.username}"
    click_on "Update Photo"

    expect(page).to have_current_path("/users/#{user.username}")
  end
end

require "rails_helper"

describe "/photos/[ID]" do
  it "has the caption of the photo" do
    user = User.new
    user.save

    photo = Photo.new
    photo.owner_id = user.username
    photo.caption = "Some caption #{rand(100)}"
    photo.save

    visit "/photos/#{photo.id}"

    expect(page).to have_content(photo.caption)
  end
end

describe "/photos/[ID]" do
  it "has the username of the owner of the photo" do
    user = User.new
    user.username = "alice_#{rand(100)}"
    user.save

    photo = Photo.new
    photo.owner_id = user.username
    photo.save

    visit "/photos/#{photo.id}"

    expect(page).to have_content(user.username)
  end
end

describe "/photos/[ID]" do
  it "has the comments left on the photo" do
    user = User.new
    user.save

    photo = Photo.new
    photo.owner_id = user.username
    photo.save

    first_commenter = User.new
    first_commenter.save

    first_comment = Comment.new
    first_comment.author_id = first_commenter.id
    first_comment.photo_id = photo.id
    first_comment.body = "Some comment #{rand(100)}"
    first_comment.save

    second_commenter = User.new
    second_commenter.save

    second_comment = Comment.new
    second_comment.author_id = second_commenter.id
    second_comment.photo_id = photo.id
    second_comment.body = "Some comment #{rand(100)}"
    second_comment.save

    visit "/photos/#{photo.id}"

    expect(page).to have_content(first_comment.body)
    expect(page).to have_content(second_comment.body)
  end
end

describe "/photos/[ID]" do
  it "has the usernames of commenters on the photo" do
    user = User.new
    user.save

    photo = Photo.new
    photo.owner_id = user.username
    photo.save

    first_commenter = User.new
    first_commenter.username = "bob_#{rand(100)}"
    first_commenter.save

    first_comment = Comment.new
    first_comment.author_id = first_commenter.id
    first_comment.photo_id = photo.id
    first_comment.save

    second_commenter = User.new
    second_commenter.username = "carol_#{rand(100)}"
    second_commenter.save

    second_comment = Comment.new
    second_comment.author_id = second_commenter.id
    second_comment.photo_id = photo.id
    second_comment.save

    visit "/photos/#{photo.id}"

    expect(page).to have_content(first_commenter.username)
    expect(page).to have_content(second_commenter.username)
  end
end

describe "/users" do
  it "has the usernames of multiple users", :points => 1 do
    first_user = User.new
    first_user.username = "alice_#{rand(100)}"
    first_user.save

    second_user = User.new
    second_user.username = "bob_#{rand(100)}"
    second_user.save

    visit "/users"

    expect(page).to have_content(first_user.username)
    expect(page).to have_content(second_user.username)
  end
end

describe "/users/[USERNAME]" do
  it "has the username of the user", :points => 1 do
    user = User.new
    user.username = "alice_#{rand(100)}"
    user.save

    visit "/users/#{user.username}"

    expect(page).to have_content(user.username)
  end
end

describe "/users/[USERNAME]" do
  it "has the photos posted by the user", :points => 1 do
    user = User.new
    user.save

    other_user = User.new
    other_user.save

    first_photo = Photo.new
    first_photo.owner_id = user.username
    first_photo.caption = "First caption #{rand(100)}"
    first_photo.save

    second_photo = Photo.new
    second_photo.owner_id = other_user.username
    second_photo.caption = "Second caption #{rand(100)}"
    second_photo.save

    third_photo = Photo.new
    third_photo.owner_id = user.username
    third_photo.caption = "Third caption #{rand(100)}"
    third_photo.save

    visit "/users/#{user.username}"

    expect(page).to have_content(first_photo.caption)
    expect(page).to have_content(third_photo.caption)
    expect(page).to have_no_content(second_photo.caption)
  end
end

describe "/users/[USERNAME]/liked_photos" do
  it "has the photos the user has liked", :points => 2 do
    user = User.new
    user.save

    other_user = User.new
    other_user.save

    first_photo = Photo.new
    first_photo.owner_id = other_user.username
    first_photo.caption = "Some caption #{rand(100)}"
    first_photo.save

    second_photo = Photo.new
    second_photo.owner_id = user.username
    second_photo.caption = "Some caption #{rand(100)}"
    second_photo.save

    third_photo = Photo.new
    third_photo.owner_id = other_user.username
    third_photo.caption = "Some caption #{rand(100)}"
    third_photo.save

    first_like = Like.new
    first_like.photo_id = first_photo.id
    first_like.fan_id = user.username
    first_like.save

    second_like = Like.new
    second_like.photo_id = second_photo.id
    second_like.fan_id = other_user.username
    second_like.save

    third_like = Like.new
    third_like.photo_id = third_photo.id
    third_like.fan_id = user.username
    third_like.save

    visit "/users/#{user.username}/liked_photos"

    expect(page).to have_content(first_photo.caption)
    expect(page).to have_content(third_photo.caption)
    expect(page).to have_no_content(second_photo.caption)
  end
end

describe "/users/[USERNAME]/feed" do
  it "has the photos posted by the people the user is following", :points => 4 do
    user = User.new
    user.save

    first_other_user = User.new
    first_other_user.save

    first_other_user_first_photo = Photo.new
    first_other_user_first_photo.owner_id = first_other_user.username
    first_other_user_first_photo.caption = "Some caption #{rand(100)}"
    first_other_user_first_photo.save
    first_other_user_second_photo = Photo.new
    first_other_user_second_photo.owner_id = first_other_user.username
    first_other_user_second_photo.caption = "Some caption #{rand(100)}"
    first_other_user_second_photo.save

    second_other_user = User.new
    second_other_user.save

    second_other_user_first_photo = Photo.new
    second_other_user_first_photo.owner_id = second_other_user.username
    second_other_user_first_photo.caption = "Some caption #{rand(100)}"
    second_other_user_first_photo.save
    second_other_user_second_photo = Photo.new
    second_other_user_second_photo.owner_id = second_other_user.username
    second_other_user_second_photo.caption = "Some caption #{rand(100)}"
    second_other_user_second_photo.save

    third_other_user = User.new
    third_other_user.save

    third_other_user_first_photo = Photo.new
    third_other_user_first_photo.owner_id = third_other_user.username
    third_other_user_first_photo.caption = "Some caption #{rand(100)}"
    third_other_user_first_photo.save
    third_other_user_second_photo = Photo.new
    third_other_user_second_photo.owner_id = third_other_user.username
    third_other_user_second_photo.caption = "Some caption #{rand(100)}"
    third_other_user_second_photo.save

    fourth_other_user = User.new
    fourth_other_user.save

    fourth_other_user_first_photo = Photo.new
    fourth_other_user_first_photo.owner_id = fourth_other_user.username
    fourth_other_user_first_photo.caption = "Some caption #{rand(100)}"
    fourth_other_user_first_photo.save
    fourth_other_user_second_photo = Photo.new
    fourth_other_user_second_photo.owner_id = fourth_other_user.username
    fourth_other_user_second_photo.caption = "Some caption #{rand(100)}"
    fourth_other_user_second_photo.save

    first_follow_request = FollowRequest.new
    first_follow_request.sender_id = user.username
    first_follow_request.recipient_id = first_other_user.username
    first_follow_request.status = "rejected"
    first_follow_request.save

    second_follow_request = FollowRequest.new
    second_follow_request.sender_id = user.username
    second_follow_request.recipient_id = second_other_user.username
    second_follow_request.status = "accepted"
    second_follow_request.save

    third_follow_request = FollowRequest.new
    third_follow_request.sender_id = user.username
    third_follow_request.recipient_id = third_other_user.username
    third_follow_request.status = "pending"
    third_follow_request.save

    fourth_follow_request = FollowRequest.new
    fourth_follow_request.sender_id = user.username
    fourth_follow_request.recipient_id = fourth_other_user.username
    fourth_follow_request.status = "accepted"
    fourth_follow_request.save

    visit "/users/#{user.username}/feed"

    expect(page).to have_content(second_other_user_first_photo.caption)
    expect(page).to have_content(second_other_user_second_photo.caption)
    expect(page).to have_content(fourth_other_user_first_photo.caption)
    expect(page).to have_content(fourth_other_user_second_photo.caption)

    expect(page).to have_no_content(first_other_user_first_photo.caption)
    expect(page).to have_no_content(third_other_user_first_photo.caption)
  end
end

describe "/users/[USERNAME]/discover" do
  it "has the photos that are liked by the people the user is following", :points => 4 do
    user = User.new
    user.save

    first_other_user = User.new
    first_other_user.save

    second_other_user = User.new
    second_other_user.save

    third_other_user = User.new
    third_other_user.save

    fourth_other_user = User.new
    fourth_other_user.save

    first_other_user_first_liked_photo = Photo.new
    first_other_user_first_liked_photo.owner_id = fourth_other_user.username
    first_other_user_first_liked_photo.caption = "Some caption #{rand(100)}"
    first_other_user_first_liked_photo.save

    first_other_user_first_like = Like.new
    first_other_user_first_like.fan_id = first_other_user.username
    first_other_user_first_like.photo_id = first_other_user_first_liked_photo.id
    first_other_user_first_like.save

    first_other_user_second_liked_photo = Photo.new
    first_other_user_second_liked_photo.owner_id = fourth_other_user.username
    first_other_user_second_liked_photo.caption = "Some caption #{rand(100)}"
    first_other_user_second_liked_photo.save

    first_other_user_first_like = Like.new
    first_other_user_first_like.fan_id = first_other_user.username
    first_other_user_first_like.photo_id = first_other_user_second_liked_photo.id
    first_other_user_first_like.save

    second_other_user_first_liked_photo = Photo.new
    second_other_user_first_liked_photo.owner_id = fourth_other_user.username
    second_other_user_first_liked_photo.caption = "Some caption #{rand(100)}"
    second_other_user_first_liked_photo.save

    second_other_user_first_like = Like.new
    second_other_user_first_like.fan_id = second_other_user.username
    second_other_user_first_like.photo_id = second_other_user_first_liked_photo.id
    second_other_user_first_like.save

    second_other_user_second_liked_photo = Photo.new
    second_other_user_second_liked_photo.owner_id = fourth_other_user.username
    second_other_user_second_liked_photo.caption = "Some caption #{rand(100)}"
    second_other_user_second_liked_photo.save

    second_other_user_first_like = Like.new
    second_other_user_first_like.fan_id = second_other_user.username
    second_other_user_first_like.photo_id = second_other_user_second_liked_photo.id
    second_other_user_first_like.save

    third_other_user_first_liked_photo = Photo.new
    third_other_user_first_liked_photo.owner_id = fourth_other_user.username
    third_other_user_first_liked_photo.caption = "Some caption #{rand(100)}"
    third_other_user_first_liked_photo.save

    third_other_user_first_like = Like.new
    third_other_user_first_like.fan_id = third_other_user.username
    third_other_user_first_like.photo_id = third_other_user_first_liked_photo.id
    third_other_user_first_like.save

    third_other_user_second_liked_photo = Photo.new
    third_other_user_second_liked_photo.owner_id = fourth_other_user.username
    third_other_user_second_liked_photo.caption = "Some caption #{rand(100)}"
    third_other_user_second_liked_photo.save

    third_other_user_first_like = Like.new
    third_other_user_first_like.fan_id = third_other_user.username
    third_other_user_first_like.photo_id = third_other_user_second_liked_photo.id
    third_other_user_first_like.save

    fourth_other_user_first_liked_photo = Photo.new
    fourth_other_user_first_liked_photo.owner_id = fourth_other_user.username
    fourth_other_user_first_liked_photo.caption = "Some caption #{rand(100)}"
    fourth_other_user_first_liked_photo.save

    fourth_other_user_first_like = Like.new
    fourth_other_user_first_like.fan_id = fourth_other_user.username
    fourth_other_user_first_like.photo_id = fourth_other_user_first_liked_photo.id
    fourth_other_user_first_like.save

    fourth_other_user_second_liked_photo = Photo.new
    fourth_other_user_second_liked_photo.owner_id = fourth_other_user.username
    fourth_other_user_second_liked_photo.caption = "Some caption #{rand(100)}"
    fourth_other_user_second_liked_photo.save

    fourth_other_user_first_like = Like.new
    fourth_other_user_first_like.fan_id = fourth_other_user.username
    fourth_other_user_first_like.photo_id = fourth_other_user_second_liked_photo.id
    fourth_other_user_first_like.save

    first_follow_request = FollowRequest.new
    first_follow_request.sender_id = user.username
    first_follow_request.recipient_id = first_other_user.username
    first_follow_request.status = "rejected"
    first_follow_request.save

    second_follow_request = FollowRequest.new
    second_follow_request.sender_id = user.username
    second_follow_request.recipient_id = second_other_user.username
    second_follow_request.status = "accepted"
    second_follow_request.save

    third_follow_request = FollowRequest.new
    third_follow_request.sender_id = user.username
    third_follow_request.recipient_id = third_other_user.username
    third_follow_request.status = "pending"
    third_follow_request.save

    fourth_follow_request = FollowRequest.new
    fourth_follow_request.sender_id = user.username
    fourth_follow_request.recipient_id = fourth_other_user.username
    fourth_follow_request.status = "accepted"
    fourth_follow_request.save

    visit "/users/#{user.username}/discover"

    expect(page).to have_content(second_other_user_first_liked_photo.caption)
    expect(page).to have_content(second_other_user_second_liked_photo.caption)
    expect(page).to have_content(fourth_other_user_first_liked_photo.caption)
    expect(page).to have_content(fourth_other_user_second_liked_photo.caption)

    expect(page).to have_no_content(first_other_user_first_liked_photo.caption)
    expect(page).to have_no_content(third_other_user_first_liked_photo.caption)
  end
end