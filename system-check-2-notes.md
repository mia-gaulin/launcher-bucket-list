## System Check Two Notes

### Learning Goals
* Generate a dynamic web page in response to a `GET` request.
* Persist information from a user submitted via a `POST` request.
* Implement code based on acceptance tests.

#### Building a Bucket List App

Building a list keeping app with Sinatra with dynamic web pages and saves information to a file.

Our app should satisfy the following requirements:

* Visiting `GET /` should redirect the user to `GET /launcher-bucket-list`.
* Visiting `GET /launcher-bucket-list` should display a list of goals to accomplish before the end of the cohort as well as a form for adding a new item to the list.
* The goal listed must be in html list element.
* The form to add a new goal requires the to be specified.
* The list of goals is read from the `bucket_list.csv` file which stores each item on a new line.
* The form submits to `POST /launcher-bucket-list` which saves the new item to the `bucket_list.csv` file.
* Submitting an empty form does not modify the `bucket_list.csv` file.


### Tips

* To avoid losing past information you'll probably want to **append** to a file rather than overwrite. You can open a file for appending and write a new line to it with the following snippet of code (the second argument, `"a"`, passed to the `CSV`'s `open` method, specifies that you want to append information):

```ruby
CSV.open("some-file.csv", "a") do |f|
  f.puts(["blah"])
end
```
* If Capybara can't find a field, double-check that the `for` attribute in the `label` element matches the `id` attribute of the `input` element.

```ruby
<label for="these_should_match">Text of label</label>
<input id="these_should_match" />
```
* Reminder: When `rspec` is run, everything in the CSV file (except the headers) is deleted. This happens both before any of the tests run **and** after every `it` and `scenario` blocks in the test suite.
