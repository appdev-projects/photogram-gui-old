require "rails_helper"

describe "/photos/[PHOTO ID]" do
  it "has a functional RCAV", points: 1 do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page.status_code).to be(200)
  end
end

describe "/photos/[PHOTO ID]" do
  it "has a p tag for the caption", points: 1 do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_css("p")
  end
end

describe "/photos/[PHOTO ID]" do
  it "has an img tag for the image", points: 1 do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_css("img")
  end
end

describe "/photos/[PHOTO ID]" do
  it "displays the correct caption", points: 3 do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_content(photo.caption)
  end
end

describe "/photos/[PHOTO ID]" do
  it "displays the correct image", points: 3 do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_css("img[src*='#{photo.image}']")
  end
end

describe "/photos" do
  it "has a functional Route Controller Action View", points: 1 do
    visit "/photos"

    expect(page.status_code).to be(200)
  end
end

describe "/photos" do
  it "displays multiple photos", points: 1 do
    create_list(:photo, 2)

    visit "/photos"

    expect(page).to have_css("img", minimum: 2)
  end
end

describe "/photos" do
  it "display multiple links to details pages", points: 1 do
    create_list(:photo, 2)

    visit "/photos"

    expect(page).to have_css("a[href*='/photos/']", minimum: 2)
  end
end

describe "/photos" do
  it "displays actual existing photos", points: 5 do
    photos = create_list(:photo, 5)

    visit "/photos"

    photos.each do |photo|
      expect(page).to have_css("img[src*='#{photo.image}']")
    end
  end
end

describe "/photos" do
  it "displays a link to the details page for every existing photo", points: 5 do
    photos = create_list(:photo, 5)

    visit "/photos"

    photos.each do |photo|
      expect(page).to have_css("img[src*='#{photo.image}']")
    end
  end
end

describe "Root URL" do
  it "is the photos index page", points: 3, hint: h("copy_must_match") do
    visit "/"

    expect(page).to have_css("h1", text: "All Photos")
  end
end

describe "/photos" do
  it "has a functional RCAV", points: 1 do
    visit "/photos"

    expect(page.status_code).to be(200)
  end
end

describe "/photos" do
  it "has a form", points: 1 do
    visit "/photos"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/photos" do
  it "has a label for 'Caption'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/photos"

    expect(page).to have_css("label", text: "Caption")
  end
end

describe "/photos" do
  it "has a label for 'Image URL'", points: 1, hint: h("copy_must_match label_for_input") do
    visit "/photos"

    expect(page).to have_css("label", text: "Image URL")
  end
end

describe "/photos" do
  it "has two inputs", points: 1, hint: h("label_for_input") do
    visit "/photos"

    expect(page).to have_css("input", count: 2)
  end
end

describe "/photos" do  it "has a button to 'Create Photo'", points: 1, hint: h("copy_must_match") do
    visit "/photos"

    expect(page).to have_css("button", text: "Create Photo")
  end
end

describe "/photos" do
  it "creates a photo when submitted", points: 3, hint: h("button_type") do
    initial_number_of_photos = Photo.count

    visit "/photos"

    click_on "Create Photo"

    final_number_of_photos = Photo.count

    expect(final_number_of_photos).to eq(initial_number_of_photos + 1)
  end
end

describe "/photos" do
  it "saves the caption when submitted", points: 2, hint: h("label_for_input") do
    test_caption = "Photogram test caption, added at time #{Time.now}."

    visit "/photos"
    fill_in("Caption", with: test_caption)
    click_on "Create Photo"

    last_photo = Photo.order(created_at: :asc).last
    expect(last_photo.caption).to eq(test_caption)
  end
end

describe "/photos" do
  it "saves the image URL when submitted", points: 2, hint: h("label_for_input") do
    test_image = "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/Pluto-01_Stern_03_Pluto_Color_TXT.jpg/240px-Pluto-01_Stern_03_Pluto_Color_TXT.jpg"

    visit "/photos"
    fill_in("Image URL", with: test_image)
    click_on "Create Photo"

    last_photo = Photo.order(created_at: :asc).last
    expect(last_photo.image).to eq(test_image)
  end
end

describe "/photos" do
  it "redirects user to index when submitted", points: 2, hint: h("redirect_vs_render") do
    visit "/photos"

    click_on "Create Photo"

    expect(page).to have_current_path("/photos")
  end
end

describe "/delete_photo/[PHOTO ID]" do
  it "removes a row from the table", points: 5 do
    photo = create(:photo)

    visit "/delete_photo/#{photo.id}"

    expect(Photo.exists?(photo.id)).to be false
  end
end

describe "/delete_photo/[PHOTO ID]" do
  it "redirects user to the index page", points: 3, hint: h("redirect_vs_render") do
    photo = create(:photo)

    visit "/delete_photo/#{photo.id}"

    expect(page).to have_current_path("/photos")
  end
end

describe "/photos/[PHOTO ID]/edit" do
  it "has a functional RCAV", points: 1 do
    photo = create(:photo)

    visit "/photos/#{photo.id}/edit"

    expect(page.status_code).to be(200)
  end
end

describe "/photos/[PHOTO ID]/edit" do
  it "has a form", points: 1 do
    photo = create(:photo)

    visit "/photos/#{photo.id}/edit"

    expect(page).to have_css("form", count: 1)
  end
end

describe "/photos/[PHOTO ID]" do
  it "has a label for 'Caption'", points: 1, hint: h("copy_must_match label_for_input") do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_css("label", text: "Caption")
  end
end

describe "/photos/[PHOTO ID]" do
  it "has a label for 'Image URL'", points: 1, hint: h("copy_must_match label_for_input") do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_css("label", text: "Image URL")
  end
end

describe "/photos/[PHOTO ID]" do
  it "has two inputs", points: 1, hint: h("label_for_input") do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_css("input", count: 2)
  end
end

describe "/photos/[PHOTO ID]" do
  it "has a button to 'Update Photo'", points: 1, hint: h("label_for_input") do
    photo = create(:photo)

    visit "/photos/#{photo.id}"

    expect(page).to have_css("button", text: "Update Photo")
  end
end

describe "/photos/[PHOTO ID]" do
  it "has caption prepopulated", points: 3, hint: h("value_attribute") do
    photo = create(:photo, caption: "Some pre-existing caption")

    visit "/photos/#{photo.id}"

    expect(page).to have_css("input[value='Some pre-existing caption']")
  end
end

describe "/photos/[PHOTO ID]" do
  it "has image image prepopulated", points: 3, hint: h("value_attribute") do
    photo = create(:photo, image: "http://some.pre-existing.image/image.jpg")

    visit "/photos/#{photo.id}"

    expect(page).to have_css("input[value='http://some.pre-existing.image/image.jpg']")
  end
end

describe "/photos/[PHOTO ID]" do
  it "updates caption when submitted", points: 5, hint: h("label_for_input button_type") do
    photo = create(:photo, caption: "Old caption")
    test_caption = "New caption, added at #{Time.now}"

    visit "/photos/#{photo.id}"
    fill_in "Caption", with: test_caption
    click_on "Update Photo"

    photo_as_revised = Photo.find(photo.id)

    expect(photo_as_revised.caption).to eq(test_caption)
  end
end

describe "/photos/[PHOTO ID]" do
  it "updates image image when submitted", points: 5, hint: h("label_for_input button_type") do
    photo = create(:photo, image: "http://old.image/image.jpg")
    test_image = "http://new.image/image_#{Time.now.to_i}.jpg"

    visit "/photos/#{photo.id}"
    fill_in "Image URL", with: test_image
    click_on "Update Photo"

    photo_as_revised = Photo.find(photo.id)

    expect(photo_as_revised.image).to eq(test_image)
  end
end

describe "/patch_photo/[PHOTO ID]" do
  it "redirects user to the show page", points: 3, hint: h("embed_vs_interpolate redirect_vs_render") do
    photo = create(:photo)

    visit "/photos/#{photo.id}"
    click_on "Update Photo"

    expect(page).to have_current_path("/photos/#{photo.id}")
  end
end