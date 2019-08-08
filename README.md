# Photogram GUI

In this project, you will add a GUI on top of the API we previously built.

[This is your target.](http://photogram-gui.herokuapp.com/) It's still a little ugly, but it's step on the path. Next week we'll add dropdowns, sign in/sign out, and CSS to polish it up.

Users should be able to see a lists of users, photos, links to details pages, links to delete, and forms to add.

Things to keep in mind:

 - When you make forms, don't forget to add a `<label>` for every form control (`<input>`, `<textarea>`, etc). The `<label>` should have a `for=""` attribute that matches the `id=""` attribute of the input. For example,

    ```html
    <label for="zebra">Fan</label>
    <input id="zebra type="text" name="qs_fan_id">
    ```

    This lets the browser know which label belongs to which input, which helps with [accessibility](https://developer.mozilla.org/en-US/docs/Learn/Accessibility/What_is_accessibility), ergonomics, SEO, and most importantly for you right now — automated tests.
 - I added some validations to try and help prevent bogus data from entering your tables. Check them out in your models.
